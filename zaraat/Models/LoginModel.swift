//
//  LoginModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct LoginModel : Codable {
    let token : String?
    let customer : Customer?
    let token_type : String?
    let expires_in : String?
    let message : String?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case token = "token"
        case customer = "customer"
        case token_type = "token_type"
        case expires_in = "expires_in"
        case message = "message"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        customer = try values.decodeIfPresent(Customer.self, forKey: .customer)
        token_type = try values.decodeIfPresent(String.self, forKey: .token_type)
        expires_in = try values.decodeIfPresent(String.self, forKey: .expires_in)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}

struct Customer : Codable {
        let customer_id : Int?
        let first_name : String?
        let last_name : String?
        let email : String?
        let provider_id : String?
        let provider : String?
        let phone : String?
        let password : String?
        let gender : String?
        let picture : String?
        let status : Int?
        let fcm_token : String?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

        case customer_id = "customer_id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case provider_id = "provider_id"
        case provider = "provider"
        case phone = "phone"
        case password = "password"
        case gender = "gender"
        case picture = "picture"
        case status = "status"
        case fcm_token = "fcm_token"
        case created_at = "created_at"
        case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        provider_id = try values.decodeIfPresent(String.self, forKey: .provider_id)
        provider = try values.decodeIfPresent(String.self, forKey: .provider)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

        }
