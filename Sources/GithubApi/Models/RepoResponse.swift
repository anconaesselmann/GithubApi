//  Created by Axel Ancona Esselmann on 6/14/24.
//

import Foundation

public enum VisibilityResponse: String, Codable {
    case `public` = "public"
}

public struct LicenseResponse: Codable {
    let key: String
    let name: String
    let url: URL?
}

public struct UserResponse: Codable {
    let login: String
    let avatarUrl: URL
    let archived: Bool
    let disabled: Bool

    let description: String?
    let createdAt: Date
    let updatedAt: Date

    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let language: String

    let license: LicenseResponse?
}

public struct RepoResponse: Codable {
    let owner: UserResponse
    let visibility: VisibilityResponse
}


public struct GithubApi {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
