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
    //var dashboardSpaceId: String
    //var phone: String
    //var publicKey: String
    //var secretKey: String
    //var shared: Bool
}


