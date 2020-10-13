//
//  SignUpModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct SignUpModel : Codable {
    let customer_id : Int?
    let customer : Customer?
    let message : String?
    let success : Int?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case customer_id = "customer_id"
        case customer = "customer"
        case message = "message"
        case success = "success"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        customer = try values.decodeIfPresent(Customer.self, forKey: .customer)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
