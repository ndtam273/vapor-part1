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
    
    init() {}
    
    // create model
    init(id: UUID? = nil, short: String, long: String) {
        self.id = id
        self.short = short
        self.long = long
    }
}


extension Acronym: Content {}

