//
//  InprogressModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 11/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct InprogressModel : Codable {
    let message : String?
    let orders : [InprogressOrders]?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case orders = "orders"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        orders = try values.decodeIfPresent([InprogressOrders].self, forKey: .orders)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct InprogressOrders : Codable {
    let order_id : Int?
    let customer_id : Int?
    let user_id : Int?
    let vendor_id : Int?
    let shipping_methods_id : Int?
    let payment_method_id : Int?
    let tracking_id : Int?
    let order_date : String?
    let status : String?
    let total_price : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case order_id = "order_id"
        case customer_id = "customer_id"
        case user_id = "user_id"
        case vendor_id = "vendor_id"
        case shipping_methods_id = "shipping_methods_id"
        case payment_method_id = "payment_method_id"
        case tracking_id = "tracking_id"
        case order_date = "order_date"
        case status = "status"
        case total_price = "total_price"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        order_id = try values.decodeIfPresent(Int.self, forKey: .order_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        shipping_methods_id = try values.decodeIfPresent(Int.self, forKey: .shipping_methods_id)
        payment_method_id = try values.decodeIfPresent(Int.self, forKey: .payment_method_id)
        tracking_id = try values.decodeIfPresent(Int.self, forKey: .tracking_id)
        order_date = try values.decodeIfPresent(String.self, forKey: .order_date)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        total_price = try values.decodeIfPresent(String.self, forKey: .total_price)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
