//
//  GetCartModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
class GetCartModel : Codable {
    var message : String?
    var cart : [Cart]?
    var status : Int?
    var success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case cart = "cart"
        case status = "status"
        case success = "success"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        cart = try values.decodeIfPresent([Cart].self, forKey: .cart)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}


class Cart : Codable {
    var cart_id : Int?
    var product_id : Int?
    var customer_id : Int?
    var created_at : String?
    var updated_at : String?
    var quantity : Int?
    var product : CartProduct?

    enum CodingKeys: String, CodingKey {

        case cart_id = "cart_id"
        case product_id = "product_id"
        case customer_id = "customer_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case quantity = "quantity"
        case product = "product"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cart_id = try values.decodeIfPresent(Int.self, forKey: .cart_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        customer_id = try values.decodeIfPresent(Int.self, forKey: .customer_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        product = try values.decodeIfPresent(CartProduct.self, forKey: .product)
    }

}


class CartProduct : Codable {
    var products_id : Int?
    var vendor_id : Int?
    var category_id : Int?
    var subcategory_id : Int?
    var child_subcategory_id : Int?
    var product_title_en : String?
    var product_title_urdu : String?
    var product_description_en : String?
    var product_description_urdu : String?
    var product_type : String?
    var product_stock : String?
    var stock_threshold : String?
    var vendor_price : String?
    var selling_price : String?
    var product_length : String?
    var product_width : String?
    var product_weight : String?
    var product_height : String?
    var product_supply_ability : String?
    var product_sku : String?
    var product_barcode : String?
    var product_status : String?
    var featured_image : String?
    var created_at : String?
    var updated_at : String?

    enum CodingKeys: String, CodingKey {

        case products_id = "products_id"
        case vendor_id = "vendor_id"
        case category_id = "category_id"
        case subcategory_id = "subcategory_id"
        case child_subcategory_id = "child_subcategory_id"
        case product_title_en = "product_title_en"
        case product_title_urdu = "product_title_urdu"
        case product_description_en = "product_description_en"
        case product_description_urdu = "product_description_urdu"
        case product_type = "product_type"
        case product_stock = "product_stock"
        case stock_threshold = "stock_threshold"
        case vendor_price = "vendor_price"
        case selling_price = "selling_price"
        case product_length = "product_length"
        case product_width = "product_width"
        case product_weight = "product_weight"
        case product_height = "product_height"
        case product_supply_ability = "product_supply_ability"
        case product_sku = "product_sku"
        case product_barcode = "product_barcode"
        case product_status = "product_status"
        case featured_image = "featured_image"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products_id = try values.decodeIfPresent(Int.self, forKey: .products_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        subcategory_id = try values.decodeIfPresent(Int.self, forKey: .subcategory_id)
        child_subcategory_id = try values.decodeIfPresent(Int.self, forKey: .child_subcategory_id)
        product_title_en = try values.decodeIfPresent(String.self, forKey: .product_title_en)
        product_title_urdu = try values.decodeIfPresent(String.self, forKey: .product_title_urdu)
        product_description_en = try values.decodeIfPresent(String.self, forKey: .product_description_en)
        product_description_urdu = try values.decodeIfPresent(String.self, forKey: .product_description_urdu)
        product_type = try values.decodeIfPresent(String.self, forKey: .product_type)
        product_stock = try values.decodeIfPresent(String.self, forKey: .product_stock)
        stock_threshold = try values.decodeIfPresent(String.self, forKey: .stock_threshold)
        vendor_price = try values.decodeIfPresent(String.self, forKey: .vendor_price)
        selling_price = try values.decodeIfPresent(String.self, forKey: .selling_price)
        product_length = try values.decodeIfPresent(String.self, forKey: .product_length)
        product_width = try values.decodeIfPresent(String.self, forKey: .product_width)
        product_weight = try values.decodeIfPresent(String.self, forKey: .product_weight)
        product_height = try values.decodeIfPresent(String.self, forKey: .product_height)
        product_supply_ability = try values.decodeIfPresent(String.self, forKey: .product_supply_ability)
        product_sku = try values.decodeIfPresent(String.self, forKey: .product_sku)
        product_barcode = try values.decodeIfPresent(String.self, forKey: .product_barcode)
        product_status = try values.decodeIfPresent(String.self, forKey: .product_status)
        featured_image = try values.decodeIfPresent(String.self, forKey: .featured_image)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
