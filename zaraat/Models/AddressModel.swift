//
//  AddressModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 12/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct BillingShipping : Codable {
    let message : String?
    let shipping : Shipping?
    let billing : Billing?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case shipping = "shipping"
        case billing = "billing"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
        billing = try values.decodeIfPresent(Billing.self, forKey: .billing)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}

struct Shipping : Codable {
    let shipping_id : Int?
    let customer_id : Int?
    let shipping_address : String?
    let shipping_phone : String?
    let shipping_person_name : String?
    let shipping_country : String?
    let shipping_state : String?
    let shipping_city : String?
    let shipping_zipcode : String?
    let shipping_longitude : String?
    let shipping_latitude : String?
    let shipping_status : String?
    let address_type : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case shipping_id = "shipping_id"
        case customer_id = "customer_id"
        case shipping_address = "shipping_address"
        case shipping_phone = "shipping_phone"
        case shipping_person_name = "shipping_person_name"
        case shipping_country = "shipping_country"
        case shipping_state = "shipping_state"
        case shipping_city = "shipping_city"
        case shipping_zipcode = "shipping_zipcode"
        case shipping_longitude = "shipping_longitude"
        case shipping_latitude = "shipping_latitude"
        case shipping_status = "shipping_status"
        case address_type = "address_type"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shipping_id = try values.decodeIfPresent(Int.self, forKey: .shipping_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        shipping_address = try values.decodeIfPresent(String.self, forKey: .shipping_address)
        shipping_phone = try values.decodeIfPresent(String.self, forKey: .shipping_phone)
        shipping_person_name = try values.decodeIfPresent(String.self, forKey: .shipping_person_name)
        shipping_country = try values.decodeIfPresent(String.self, forKey: .shipping_country)
        shipping_state = try values.decodeIfPresent(String.self, forKey: .shipping_state)
        shipping_city = try values.decodeIfPresent(String.self, forKey: .shipping_city)
        shipping_zipcode = try values.decodeIfPresent(String.self, forKey: .shipping_zipcode)
        shipping_longitude = try values.decodeIfPresent(String.self, forKey: .shipping_longitude)
        shipping_latitude = try values.decodeIfPresent(String.self, forKey: .shipping_latitude)
        shipping_status = try values.decodeIfPresent(String.self, forKey: .shipping_status)
        address_type = try values.decodeIfPresent(String.self, forKey: .address_type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
struct Billing : Codable {
    let billing_id : Int?
    let customer_id : Int?
    let billing_address : String?
    let billing_phone : String?
    let billing_person_name : String?
    let billing_country : String?
    let billing_state : String?
    let billing_city : String?
    let billing_zipcode : String?
    let billing_longitude : String?
    let billing_latitude : String?
    let billing_status : String?
    let address_type : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case billing_id = "billing_id"
        case customer_id = "customer_id"
        case billing_address = "billing_address"
        case billing_phone = "billing_phone"
        case billing_person_name = "billing_person_name"
        case billing_country = "billing_country"
        case billing_state = "billing_state"
        case billing_city = "billing_city"
        case billing_zipcode = "billing_zipcode"
        case billing_longitude = "billing_longitude"
        case billing_latitude = "billing_latitude"
        case billing_status = "billing_status"
        case address_type = "address_type"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        billing_id = try values.decodeIfPresent(Int.self, forKey: .billing_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        billing_address = try values.decodeIfPresent(String.self, forKey: .billing_address)
        billing_phone = try values.decodeIfPresent(String.self, forKey: .billing_phone)
        billing_person_name = try values.decodeIfPresent(String.self, forKey: .billing_person_name)
        billing_country = try values.decodeIfPresent(String.self, forKey: .billing_country)
        billing_state = try values.decodeIfPresent(String.self, forKey: .billing_state)
        billing_city = try values.decodeIfPresent(String.self, forKey: .billing_city)
        billing_zipcode = try values.decodeIfPresent(String.self, forKey: .billing_zipcode)
        billing_longitude = try values.decodeIfPresent(String.self, forKey: .billing_longitude)
        billing_latitude = try values.decodeIfPresent(String.self, forKey: .billing_latitude)
        billing_status = try values.decodeIfPresent(String.self, forKey: .billing_status)
        address_type = try values.decodeIfPresent(String.self, forKey: .address_type)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
