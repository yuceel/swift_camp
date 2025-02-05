import Foundation
import Network
import SystemConfiguration.CaptiveNetwork
import UIKit
import Combine

class NetworkHelper {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    // MARK: - Singleton Instance
    static let shared = NetworkHelper()
    
    // MARK: - Published Properties
    @Published var isConnected: Bool = false
    @Published var networkType: String = "Unknown"
    @Published var networkProtocol: String = "Unknown"
    @Published var downloadSpeed: Double = 0.0
    @Published var uploadSpeed: Double = 0.0
    @Published var ping: Double = 0.0
    @Published var jitter: Double = 0.0
    @Published var cloudflareInfo: [String] = []
    @Published var isVPNActive: Bool = false
    @Published var publicIP: String? = nil
    @Published var dnsLatency: Double = 0.0
    @Published var connectionIssue: String? = nil
    @Published var connectionWarning: String? = nil
    
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            self.isConnected = (path.status == .satisfied)
            
            if path.usesInterfaceType(.wifi) {
                self.networkType = "WiFi"
            } else if path.usesInterfaceType(.cellular) {
                self.networkType = "Cellular"
            } else {
                self.networkType = "Unknown"
            }
            
            self.measurePing { ping in
                DispatchQueue.main.async {
                    self.ping = ping
                    self.checkNetworkHealth(ping: 100.0, downloadSpeed: 10.0, uploadSpeed: 3.0)
                }
            }
            
            self.isVPNActive = self.isVPNConnected()
            
            self.fetchCloudflareInfo { info in
                DispatchQueue.main.async {
                    self.cloudflareInfo = info
                }
            }
            
            self.fetchPublicIPAddress { ip in
                DispatchQueue.main.async {
                    self.publicIP = ip
                }
            }
            
            // Connection speed measurements
            self.measureDownloadSpeed { speed in
                DispatchQueue.main.async {
                    self.downloadSpeed = speed
                }
            }
            
            self.measureUploadSpeed { speed in
                DispatchQueue.main.async {
                    self.uploadSpeed = speed
                }
            }
            
            self.measureDNSPerformance { latency in
                DispatchQueue.main.async {
                    self.dnsLatency = latency
                }
            }
            
            self.networkProtocol = self.checkNetworkProtocol()
        }
        monitor.start(queue: queue)
    }
    
    // MARK: - Connection Status and Type
    
    /// Active Connection Status: Is the device offline or online?
    func isConnectedToNetwork() -> Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    /// WiFi / Mobile Data Distinction: Determines the active network type
    func getNetworkType() -> String {
        if monitor.currentPath.usesInterfaceType(.wifi) {
            return "WiFi"
        } else if monitor.currentPath.usesInterfaceType(.cellular) {
            return "Cellular"
        } else {
            return "Unknown"
        }
    }
    
    /// Check Network Protocol
    func checkNetworkProtocol() -> String {
        let path = monitor.currentPath
           var protocolType = "Unknown"
           
           if path.usesInterfaceType(.wifi) || path.usesInterfaceType(.cellular) {
               if path.supportsIPv6 {
                   protocolType = "IPv6"
               } else {
                   protocolType = "IPv4"
               }
           }
           
           return protocolType
    }
    
    // MARK: - Connection Speed and Performance
    
    /// Download Speed: Calculated using Cloudflare
    func measureDownloadSpeed(completion: @escaping (Double) -> Void) {
        let url = URL(string: "https://speed.cloudflare.com/__down?bytes=10000000")!  // 10MB test file
        let startTime = Date()
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(0.0)  // Return 0 Mbps in case of an error
                return
            }
            let elapsedTime = Date().timeIntervalSince(startTime)  // Elapsed time
            let fileSize = Double(data.count) / (1024 * 1024)  // In MB
            let speedMbps = (fileSize / elapsedTime) * 8  // Calculate in Mbps
            completion(speedMbps)
        }.resume()
    }
    
    /// Upload Speed: Calculated using Cloudflare
    func measureUploadSpeed(completion: @escaping (Double) -> Void) {
        let url = URL(string: "https://speed.cloudflare.com/__up")!
        let dataToUpload = Data(repeating: 0, count: 10_000_000)  // 10 MB dummy data
        let startTime = Date()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30.0  // Adding timeout
        
        URLSession.shared.uploadTask(with: request, from: dataToUpload) { responseData, response, error in
            guard error == nil else {
                LoggerHelper.shared.error("Upload error: \(error!.localizedDescription)")  // Show error message
                completion(0.0)  // Return 0 Mbps in case of an error
                return
            }
            let elapsedTime = Date().timeIntervalSince(startTime)  // Elapsed time
            let fileSize = Double(dataToUpload.count) / (1024 * 1024)  // In MB
            let speedMbps = (fileSize / elapsedTime) * 8  // Calculate in Mbps
            LoggerHelper.shared.info("Upload speed: \(speedMbps) Mbps")  // Print to console
            completion(speedMbps)
        }.resume()
    }
    
    /// Ping Value: Time it takes the request to go back and forth to the server (ms).
    func measurePing(completion: @escaping (Double) -> Void) {
        let startTime = Date()
        let url = URL(string: "https://www.cloudflare.com")!
        
        URLSession.shared.dataTask(with: url) { _, _, _ in
            let elapsedTime = Date().timeIntervalSince(startTime) * 1000  // Convert to ms
            completion(elapsedTime)
        }.resume()
    }
    
    /// Check network health
    func checkNetworkHealth(ping: Double, downloadSpeed: Double, uploadSpeed: Double) {
        if ping > 100 {
            connectionIssue = "Ping is too high"
        }
        if downloadSpeed < 10.0 {
            connectionIssue = "Download speed is too low"
        }
        if uploadSpeed < 3.0 {
            connectionIssue = "Upload speed is too low"
        }
    }
    
    /// Jitter: Calculates fluctuations in latency
    func measureJitter(pingValues: [Double], completion: @escaping (Double) -> Void) {
        guard !pingValues.isEmpty else {
            completion(0.0)
            return
        }
        let meanPing = pingValues.reduce(0, +) / Double(pingValues.count)
        let jitter = pingValues.map { abs($0 - meanPing) }.reduce(0, +) / Double(pingValues.count)
        completion(jitter)
    }
    
    // MARK: - Cloudflare Information
    
    /// Fetches additional information from Cloudflare
    func fetchCloudflareInfo(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: "https://www.cloudflare.com/cdn-cgi/trace") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                LoggerHelper.shared.error("Failed to retrieve Cloudflare info")
                completion(["❌ Failed to retrieve Cloudflare info"])
                return
            }
            
            let responseString = String(data: data, encoding: .utf8) ?? ""
            let lines = responseString.split(separator: "\n")
            
            var cloudflareInfo: [String] = []
            let emojiMapping: [String: String] = [
                "warp": "🌀", "ts": "⏳", "h": "🌐", "rbi": "🔍", "loc": "📍",
                "sni": "🔑", "sliver": "💎", "ip": "📡", "gateway": "🚪",
                "colo": "🏙", "visit_scheme": "🔗", "http": "📜", "kex": "🔐",
                "tls": "🛡", "fl": "🎛", "uag": "📱"
            ]
            
            for line in lines {
                let parts = line.split(separator: "=")
                if parts.count == 2 {
                    let key = String(parts[0])
                    let value = String(parts[1])
                    let emoji = emojiMapping[key] ?? "ℹ️"
                    cloudflareInfo.append("\(emoji) \(key): \(value)")
//                    LoggerHelper.shared.info("\(emoji) \(key): \(value)")
                }
            }
            
            completion(cloudflareInfo)
        }.resume()
    }
    
    
    // MARK: - VPN Checks
    
    /// VPN Connection Status: Is there an active VPN connection?
    func isVPNConnected() -> Bool {
        guard let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
              let scopes = settings["__SCOPED__"] as? [String: Any] else {
            return false
        }
        let vpnInterfaces = ["utun", "ppp", "ipsec", "tap", "tun"]
        return scopes.keys.contains { key in
            vpnInterfaces.contains { key.contains($0) }
        }
    }

    
    // MARK: - Network Provider and IP Information
    
    /// Public IP Address
    func fetchPublicIPAddress(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://api64.ipify.org?format=json")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let ip = json["ip"] as? String {
                completion(ip)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    // MARK: - Cloudflare and DNS Information
    
    /// DNS Performance: Checks how quickly DNS queries are resolved
    func measureDNSPerformance(completion: @escaping (Double) -> Void) {
        let startTime = Date()
        let host = "1.1.1.1"
        
        let task = URLSession.shared.dataTask(with: URL(string: "https://\(host)")!) { _, _, _ in
            let elapsedTime = Date().timeIntervalSince(startTime) * 1000  // Convert to ms
            completion(elapsedTime)
        }
        task.resume()
    }
    
    // MARK: - Connection Stability Checks
    
    /// Monitors network stability based on connection drops
    func monitorConnectionStability() {
        monitor.pathUpdateHandler = { path in
            if path.status == .unsatisfied {
                self.logNetworkIssues(issue: "Network disconnected")
            } else {
                LoggerHelper.shared.info("Network stable")
            }
        }
    }
    
    // MARK: - Logging and Reporting
    
    /// Logs network errors and delays
    func logNetworkIssues(issue: String) {
        LoggerHelper.shared.error("[Network Issue]: \(issue)")
    }
}
