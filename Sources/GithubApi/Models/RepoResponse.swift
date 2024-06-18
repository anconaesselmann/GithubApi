//  Created by Axel Ancona Esselmann on 6/14/24.
//

import Foundation

public enum VisibilityResponse: String, Codable {
    case `public` = "public"
}

public struct LicenseResponse: Codable {
    public let key: String
    public let name: String
    public let url: URL?

    public init(key: String, name: String, url: URL?) {
        self.key = key
        self.name = name
        self.url = url
    }
}

public struct UserResponse: Codable {
    public let login: String
    public let avatarUrl: URL

    public init(login: String, avatarUrl: URL) {
        self.login = login
        self.avatarUrl = avatarUrl
    }
}

public struct RepoResponse: Codable {
    public let name: String
    public let archived: Bool
    public let owner: UserResponse

    public let description: String?
    public let createdAt: Date
    public let updatedAt: Date

    public let stargazersCount: Int
    public let watchersCount: Int
    public let forksCount: Int
    public let language: String
    public let disabled: Bool

    public let license: LicenseResponse?
    public let visibility: VisibilityResponse

    public init(name: String, archived: Bool, owner: UserResponse, description: String?, createdAt: Date, updatedAt: Date, stargazersCount: Int, watchersCount: Int, forksCount: Int, language: String, disabled: Bool, license: LicenseResponse?, visibility: VisibilityResponse) {
        self.name = name
        self.archived = archived
        self.owner = owner
        self.description = description
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.forksCount = forksCount
        self.language = language
        self.disabled = disabled
        self.license = license
        self.visibility = visibility
    }
}


public struct GithubApi {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
