//
//  File.swift
//  
//
//  Created by TAM NGUYEN DUC on 1/18/21.
//

import Foundation
import Vapor
import Fluent

final class Acronym: Model {
    // table name
    static let schema = "acronyms"
    
    // table : column id
    @ID
    var id: UUID?
    
    @Field(key: "short")
    var short: String
    
    @Field(key: "long")
    var long: String
    
    @Parent(key: "userID")
    var user: User
    
    @Siblings(
        through: AcronymCategoryPivot.self,
        from: \.$acronym,
        to: \.$category
    )
    
    var categories: [Category]
    
    init() {}
    
    // create model
    init(id: UUID? = nil, short: String, long: String, userID: User.IDValue) {
        self.id = id
        self.short = short
        self.long = long
        self.$user.id = userID
    }
}


extension Acronym: Content {}

//6D303EAF-42CF-4BFF-A18F-8580A5BD876F
//
//27EC6AC9-3B51-4282-875E-A8012F8FF8D5
