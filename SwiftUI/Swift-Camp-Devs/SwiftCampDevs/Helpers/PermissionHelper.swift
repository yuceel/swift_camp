import Foundation
import AVFoundation         // Microphone add Camera Permission
import Contacts             // Contacts Permission
import Photos               // Photo Library Permission
import UserNotifications    // Notification Permission
import Intents              // Siri Permission
import EventKit             // Reminders
import CoreLocation         // Location Permission

final class PermissionHelper: NSObject, CLLocationManagerDelegate {
    static let shared = PermissionHelper()
    private let locationManager = CLLocationManager()
    private var locationCompletion: ((Bool) -> Void)?
    
    private override init() {
        super.init()
        locationManager.delegate = self
    }

    // MARK: - Notifications Permission
    func checkNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                    completion(granted)
                }
            case .authorized, .provisional:
                completion(true)
            case .denied:
                completion(false)
            @unknown default:
                completion(false)
            }
        }
    }

    // MARK: - Contacts Permission
    func checkContactsPermission(completion: @escaping (Bool) -> Void) {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        switch status {
        case .notDetermined:
            CNContactStore().requestAccess(for: .contacts) { granted, _ in
                completion(granted)
            }
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }

    // MARK: - Microphone Permission
    func checkMicrophonePermission(completion: @escaping (Bool) -> Void) {
        let status = AVAudioSession.sharedInstance().recordPermission
        switch status {
        case .undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                completion(granted)
            }
        case .granted:
            completion(true)
        case .denied:
            completion(false)
        @unknown default:
            completion(false)
        }
    }

    // MARK: - Photo Library Permission
    func checkPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                completion(newStatus == .authorized || newStatus == .limited)
            }
        case .authorized, .limited:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }

    // MARK: - Siri Permission
    func checkSiriPermission(completion: @escaping (Bool) -> Void) {
        let status = INPreferences.siriAuthorizationStatus()
        switch status {
        case .notDetermined:
            INPreferences.requestSiriAuthorization { newStatus in
                completion(newStatus == .authorized)
            }
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }

    // MARK: - Reminders Permission
    func checkRemindersPermission(completion: @escaping (Bool) -> Void) {
        let eventStore = EKEventStore()
        switch EKEventStore.authorizationStatus(for: .reminder) {
        case .notDetermined:
            eventStore.requestAccess(to: .reminder) { granted, _ in
                completion(granted)
            }
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }

    // MARK: - Location Permission
    func checkLocationPermission(always: Bool = false, completion: @escaping (Bool) -> Void) {
        locationCompletion = completion
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            if always {
                locationManager.requestAlwaysAuthorization()
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        case .authorizedWhenInUse, .authorizedAlways:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }

    // Location permission change return
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationCompletion?(true)
        case .denied, .restricted:
            locationCompletion?(false)
        default:
            break
        }
    }

    // MARK: - Storage Permission (Documents Directory Access)
    func checkStoragePermission(completion: @escaping (Bool) -> Void) {
        let fileManager = FileManager.default
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first

        guard let path = documentsPath?.path else {
            completion(false)
            return
        }

        let isWritable = fileManager.isWritableFile(atPath: path)
        completion(isWritable)
    }

    // MARK: - External Storage Check (Media Library)
    func checkExternalStorageAccess(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
                completion(newStatus == .authorized)
            }
        case .authorized:
            completion(true)
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }
}
