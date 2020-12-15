//
//  PlaceOrderModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 12/15/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct PlaceOrderModel : Codable {
    let shipping_id : Int?
    let billing_id : Int?
    let payment_method : String?
    let cn_code : String?
    let total : Int?
    let items : [PlaceOrderModelItems]?

    enum CodingKeys: String, CodingKey {

        case shipping_id = "shipping_id"
        case billing_id = "billing_id"
        case payment_method = "payment_method"
        case cn_code = "cn_code"
        case total = "total"
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shipping_id = try values.decodeIfPresent(Int.self, forKey: .shipping_id)
        billing_id = try values.decodeIfPresent(Int.self, forKey: .billing_id)
        payment_method = try values.decodeIfPresent(String.self, forKey: .payment_method)
        cn_code = try values.decodeIfPresent(String.self, forKey: .cn_code)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        items = try values.decodeIfPresent([PlaceOrderModelItems].self, forKey: .items)
    }

}

struct PlaceOrderModelItems : Codable {
    let product_id : Int?
    let price : Int?
    let order_quantity : Int?

    enum CodingKeys: String, CodingKey {

        case product_id = "product_id"
        case price = "price"
        case order_quantity = "order_quantity"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        order_quantity = try values.decodeIfPresent(Int.self, forKey: .order_quantity)
    }

}
