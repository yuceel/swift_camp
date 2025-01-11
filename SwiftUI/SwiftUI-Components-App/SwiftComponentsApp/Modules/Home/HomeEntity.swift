import Foundation

// Repository Info Entity
struct GithubRepoInfo {
    var commitCount: Int
    var closedPRCount: Int
    var branchCount: Int
    var contributors: [Contributor]
}

// Contributor Entity
struct Contributor: Identifiable, Decodable {
    let id: Int
    let login: String
    let avatar_url: String
    let html_url: String
    
    var username: String { login }
    var avatarURL: String { avatar_url }
    var profileURL: String { html_url }
}

// Navigation Button Entity
struct ButtonModel: Identifiable {
    let id = UUID()
    let title: String
    let action: () -> Void
}

// API Response Entities
struct Commit: Decodable {}
struct PullRequest: Decodable {}
struct Branch: Decodable {}
