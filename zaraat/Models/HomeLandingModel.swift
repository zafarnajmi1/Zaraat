//
//  HomeLandingModel.swift
//  zaraat
//
//  Created by ZafarNajmi on 10/8/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
struct HomeLandingModel : Codable {
    let message : String?
    let data : HomeLandingData?
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
        data = try values.decodeIfPresent(HomeLandingData.self, forKey: .data)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        success = try values.decodeIfPresent(Int.self, forKey: .success)
    }

}


struct HomeLandingData : Codable {
    let sales : [Sales]?
    let top_products : [Top_products]?
    let weekly_products : [Weekly_products]?
    let featured_products : [Featured_products]?
    let ad_1 : Ad_1?
    let ad_2 : Ad_2?
    let ad_3 : Ad_3?

    enum CodingKeys: String, CodingKey {

        case sales = "sales"
        case top_products = "top_products"
        case weekly_products = "weekly_products"
        case featured_products = "featured_products"
        case ad_1 = "ad_1"
        case ad_2 = "ad_2"
        case ad_3 = "ad_3"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sales = try values.decodeIfPresent([Sales].self, forKey: .sales)
        top_products = try values.decodeIfPresent([Top_products].self, forKey: .top_products)
        weekly_products = try values.decodeIfPresent([Weekly_products].self, forKey: .weekly_products)
        featured_products = try values.decodeIfPresent([Featured_products].self, forKey: .featured_products)
        ad_1 = try values.decodeIfPresent(Ad_1.self, forKey: .ad_1)
        ad_2 = try values.decodeIfPresent(Ad_2.self, forKey: .ad_2)
        ad_3 = try values.decodeIfPresent(Ad_3.self, forKey: .ad_3)
    }

}


struct Top_products : Codable {
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
    let avg_rating : Double?
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
        case avg_rating = "avg_rating"
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
        avg_rating = try values.decodeIfPresent(Double.self, forKey: .avg_rating)
    }

}
struct Sales : Codable {
    let onsale_id : Int?
    let product_id : Int?
    let user_id : Int?
    let vendor_id : Int?
    let actual_price : String?
    let discount_percent : Int?
    let sale_price : String?
    let start_date : String?
    let end_date : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?
    let product : Product?

    enum CodingKeys: String, CodingKey {

        case onsale_id = "onsale_id"
        case product_id = "product_id"
        case user_id = "user_id"
        case vendor_id = "vendor_id"
        case actual_price = "actual_price"
        case discount_percent = "discount_percent"
        case sale_price = "sale_price"
        case start_date = "start_date"
        case end_date = "end_date"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case product = "product"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        onsale_id = try values.decodeIfPresent(Int.self, forKey: .onsale_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        actual_price = try values.decodeIfPresent(String.self, forKey: .actual_price)
        discount_percent = try values.decodeIfPresent(Int.self, forKey: .discount_percent)
        sale_price = try values.decodeIfPresent(String.self, forKey: .sale_price)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        product = try values.decodeIfPresent(Product.self, forKey: .product)
    }

}

struct Product : Codable {
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
    let image : [Image]?

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
        case image = "image"
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
        image = try values.decodeIfPresent([Image].self, forKey: .image)
    }

}


struct Weekly_products : Codable {
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
    let avg_rating : Double?
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
        case avg_rating = "avg_rating"
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
        avg_rating = try values.decodeIfPresent(Double.self, forKey: .avg_rating)
    }

}


struct Featured_products : Codable {
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
    let avg_rating : Double?
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
        case avg_rating = "avg_rating"
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
        avg_rating = try values.decodeIfPresent(Double.self, forKey: .avg_rating)
        
    }

}

struct Image : Codable {
    let gallery_id : Int?
    let product_id : Int?
    let file_path : String?
    let file_status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case gallery_id = "gallery_id"
        case product_id = "product_id"
        case file_path = "file_path"
        case file_status = "file_status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gallery_id = try values.decodeIfPresent(Int.self, forKey: .gallery_id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        file_path = try values.decodeIfPresent(String.self, forKey: .file_path)
        file_status = try values.decodeIfPresent(Int.self, forKey: .file_status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}


struct Ad_3 : Codable {
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Ad_2 : Codable {
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Ad_1 : Codable {
    let categories_id : Int?
    let market : String?
    let category_title_en : String?
    let category_title_urdu : String?
    let category_image : String?
    let category_description_en : String?
    let category_description_urdu : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case categories_id = "categories_id"
        case market = "market"
        case category_title_en = "category_title_en"
        case category_title_urdu = "category_title_urdu"
        case category_image = "category_image"
        case category_description_en = "category_description_en"
        case category_description_urdu = "category_description_urdu"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories_id = try values.decodeIfPresent(Int.self, forKey: .categories_id)
        market = try values.decodeIfPresent(String.self, forKey: .market)
        category_title_en = try values.decodeIfPresent(String.self, forKey: .category_title_en)
        category_title_urdu = try values.decodeIfPresent(String.self, forKey: .category_title_urdu)
        category_image = try values.decodeIfPresent(String.self, forKey: .category_image)
        category_description_en = try values.decodeIfPresent(String.self, forKey: .category_description_en)
        category_description_urdu = try values.decodeIfPresent(String.self, forKey: .category_description_urdu)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
