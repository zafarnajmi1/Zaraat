//
//  UserProfileModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
class UserProfile : Codable {
    let message : String?
    let user : User?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case user = "user"
        case status = "status"
        case success = "success"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

class User : Codable {
    let customer_id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let phone : String?
    let password : String?
    let gender : String?
    let picture : String?
    let status : Int?
    let provider : String?
    let provider_id : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case customer_id = "customer_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case phone = "phone"
        case password = "password"
        case gender = "gender"
        case picture = "picture"
        case status = "status"
        case provider = "provider"
        case provider_id = "provider_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        provider = try values.decodeIfPresent(String.self, forKey: .provider)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
