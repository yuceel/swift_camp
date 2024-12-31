import Foundation

final class HomeInteractor: HomeInteractorInterface {
    let baseURL = "https://api.github.com/repos/masterfabric-mobile/swift_camp"
    
    // MARK: - Public Interface Method

    func fetchRepoInfo(completion: @escaping (GithubRepoInfo) -> Void) {
        var repoInfo = GithubRepoInfo(commitCount: 0, closedPRCount: 0, branchCount: 0, contributors: [])
        let group = DispatchGroup()
               
               // Fetch commits
               group.enter()
               fetchPaginatedData(endpoint: "commits", collection: [Commit]()) { commits in
                   repoInfo.commitCount = commits.count
                   group.leave()
               }
        // Fetch PRs
               group.enter()
               fetchPaginatedData(endpoint: "pulls", collection: [PullRequest]()) { pulls in
                   repoInfo.closedPRCount = pulls.count
                   group.leave()
               }
               
               // Fetch branches
               group.enter()
               fetchGenericData(from: "\(baseURL)/branches") { (branches: [Branch]) in
                   repoInfo.branchCount = branches.count
                   group.leave()
               }
               
               // Fetch contributors
               group.enter()
               fetchGenericData(from: "\(baseURL)/contributors") { (contributors: [Contributor]) in
                   repoInfo.contributors = contributors
                   group.leave()
               }
               
               group.notify(queue: .main) {
                   completion(repoInfo)
               }
    }
        
    // MARK: - Private Helper Methods
    
    private func fetchPaginatedData<T: Decodable>(
            endpoint: String,
            perPage: Int = 100,
            collection: [T] = [],
            page: Int = 1,
            completion: @escaping ([T]) -> Void
        ) {
            let url = if endpoint == "pulls" {
                "\(baseURL)/\(endpoint)?state=closed&per_page=\(perPage)&page=\(page)"
            } else {
                "\(baseURL)/\(endpoint)?per_page=\(perPage)&page=\(page)"
            }
            
            fetchGenericData(from: url) { (items: [T]) in
                var updatedCollection = collection
                updatedCollection.append(contentsOf: items)
                
                if items.count == perPage {
                    self.fetchPaginatedData(
                        endpoint: endpoint,
                        perPage: perPage,
                        collection: updatedCollection,
                        page: page + 1,
                        completion: completion
                    )
                } else {
                    completion(updatedCollection)
                }
            }
        }
        
        private func fetchGenericData<T: Decodable>(
            from urlString: String,
            completion: @escaping (T) -> Void
        ) {
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                } catch {
                    print("Failed to decode data from \(urlString): \(error)")
                }
            }.resume()
        }
    
    
    
}
