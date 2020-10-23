//
//  B2BHomeLanding.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/22/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct B2bHomeLandingModel : Codable {
    
    let message : String?
    let data : B2bHomeData?
    let status : Int?
    let success : Int?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case data = "data"
        case status = "status"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(B2bHomeData.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}
struct B2bHomeData : Codable {
    let section_1 : [Section_1]?
    let section_2 : [Section_2]?
    let section_3 : [Section_3]?
    let ad_1 : Ad_1?
    let ad_2 : Ad_2?
    let ad_3 : Ad_3?
    let other_channels : [Other_channels]?

    enum CodingKeys: String, CodingKey {

        case section_1 = "section_1"
        case section_2 = "section_2"
        case section_3 = "section_3"
        case ad_1 = "ad_1"
        case ad_2 = "ad_2"
        case ad_3 = "ad_3"
        case other_channels = "other_channels"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        section_1 = try values.decodeIfPresent([Section_1].self, forKey: .section_1)
        section_2 = try values.decodeIfPresent([Section_2].self, forKey: .section_2)
        section_3 = try values.decodeIfPresent([Section_3].self, forKey: .section_3)
        ad_1 = try values.decodeIfPresent(Ad_1.self, forKey: .ad_1)
        ad_2 = try values.decodeIfPresent(Ad_2.self, forKey: .ad_2)
        ad_3 = try values.decodeIfPresent(Ad_3.self, forKey: .ad_3)
        other_channels = try values.decodeIfPresent([Other_channels].self, forKey: .other_channels)
    }

}

struct Other_channels : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?

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
        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
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
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct Section_1 : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let vendor_package : Vendor_package?

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
        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case vendor_package = "vendor_package"
    }

    init(from decoder: Decoder) throws {
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
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        vendor_package = try values.decodeIfPresent(Vendor_package.self, forKey: .vendor_package)
    }

}
struct Section_2 : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let vendor_package : Vendor_package?

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
        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case vendor_package = "vendor_package"
    }

    init(from decoder: Decoder) throws {
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
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        vendor_package = try values.decodeIfPresent(Vendor_package.self, forKey: .vendor_package)
    }

}
struct Section_3 : Codable {
    let products_id : Int?
    let vendor_id : Int?
    let category_id : Int?
    let subcategory_id : Int?
    let child_subcategory_id : Int?
    let product_title_en : String?
    let product_title_urdu : String?
    let product_description_en : String?
    let product_description_urdu : String?
    let product_type : String?
    let product_stock : String?
    let stock_threshold : String?
    let vendor_price : String?
    let selling_price : String?
    let product_length : String?
    let product_width : String?
    let product_weight : String?
    let product_height : String?
    let product_supply_ability : String?
    let product_sku : String?
    let product_barcode : String?
    let product_status : String?
    let featured_image : String?
    let created_at : String?
    let updated_at : String?
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let vendor_package : Vendor_package?

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
        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case vendor_package = "vendor_package"
    }

    init(from decoder: Decoder) throws {
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
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        vendor_package = try values.decodeIfPresent(Vendor_package.self, forKey: .vendor_package)
    }

}