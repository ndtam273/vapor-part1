//
//  File.swift
//  
//
//  Created by TAM NGUYEN DUC on 1/20/21.
//

import Foundation
import Fluent
import Vapor

final class Category: Model, Content {
    static let schema = "categories"
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Siblings(
        through: AcronymCategoryPivot.self,
        from: \.$category,
        to: \.$acronym
    )
    
    var acronyms: [Acronym]
    
    init() {}
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name 
    }
    
}
