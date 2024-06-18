//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

public extension URL {

    enum Error: Swift.Error {
        case invalidUrl
    }

    static func githubRepo(githubUserName org: String, repoName name: String) throws -> URL {
        guard let url = URL(string: "https://github.com/\(org)/\(name)") else {
            throw Error.invalidUrl
        }
        return url
    }

    static func githubReleases(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)/releases") else {
            throw Error.invalidUrl
        }
        return url
    }

    static func githubContributors(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)/contributors") else {
            throw Error.invalidUrl
        }
        return url
    }

    static func githubProjectInfo(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)") else {
            throw Error.invalidUrl
        }
        return url
    }

    func githubRepo() throws -> GithubRepo {
        guard let result = try #/github\.com[\/|:](?<org>[^\/]+)\/(?<repo>[^\/\s\.]+)/#
            .firstMatch(in: self.absoluteString)
        else {
            throw Error.invalidUrl
        }
        let org = String(result.output.org)
        let repo = String(result.output.repo)
        return GithubRepo(org: org, reop: repo)
    }
}

public struct GithubRepo {
    public init(org: String, reop: String) {
        self.org = org
        self.reop = reop
    }
    
    public let org: String
    public let reop: String
}
