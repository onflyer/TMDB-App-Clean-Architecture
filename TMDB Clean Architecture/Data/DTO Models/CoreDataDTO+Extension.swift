//
//  CoreDataDTO+Extension.swift
//  TMDB App
//
//  Created by Aleksandar Milidrag on 3/25/24.
//

import Foundation
import CoreData

extension CoreDataDTO {
    
   public var id: Int? {
       get {
           Int(id_)
       }
       set {
           id_ = Int64(newValue ?? 0)
       }
    }
    
    var title: String? {
        get {
            title_
        }
        set {
            title_ = newValue
        }
    }
    
    var posterPath: String? {
        get {
            posterPath_
        }
        set {
            posterPath_ = newValue
        }
    }
    
    convenience init(id: Int, title: String, posterPath: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.title = title
        self.posterPath = posterPath
    }
}
