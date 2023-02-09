//
//  Model.swift
//  Userdetails_iOS
//
//  Created by Rohin Madhavan on 08/02/2023.
//

import Foundation

struct UserData: Codable {
    var profile: Profile
}

struct Profile: Codable {
    var id: String
    var phone: String
    var appId: String
    var verified: Bool
    var active: Bool
    var groups: [Groups]
}

struct Groups: Codable {
    var id: String
    var source: String
    var name: String
    var credentials: [Credentials]
}

struct Credentials: Codable {
    var id: String
    var note: String
    var groupId: String
    var name: String
    var username: String
    var email: String
    var password: String
    var logo: String
    var dashboardSpaceId: String?
    var phone: String?
    var publicKey: String?
    var secretKey: String?
    var shared: Bool?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.note = try container.decode(String.self, forKey: .note)
        self.groupId = try container.decode(String.self, forKey: .groupId)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
        self.email = try container.decode(String.self, forKey: .email)
        self.password = try container.decode(String.self, forKey: .password)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.dashboardSpaceId = try container.decodeIfPresent(String.self, forKey: .dashboardSpaceId)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.publicKey = try container.decodeIfPresent(String.self, forKey: .publicKey)
        self.secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
        self.shared = try container.decodeIfPresent(Bool.self, forKey: .shared)
    }
}


