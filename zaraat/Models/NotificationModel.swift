//
//  NotificationModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/6/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct NotificationModel : Codable {
    let message : String?
    let customer : Customer?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case customer = "customer"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        customer = try values.decodeIfPresent(Customer.self, forKey: .customer)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}
