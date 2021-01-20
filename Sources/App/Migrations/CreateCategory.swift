//
//  File.swift
//  
//
//  Created by TAM NGUYEN DUC on 1/20/21.
//

import Foundation
import Fluent

struct CreateCatetory: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("categories")
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("categories").delete()
    }
}
