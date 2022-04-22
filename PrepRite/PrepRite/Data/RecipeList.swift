//
//  RecipeList.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import Foundation
import FirebaseFirestoreSwift

struct RecipeList: Codable, Identifiable{
    @DocumentID var id: String?
    let type: String?
    let protein: String?
    let veggie: String?
    let url: String?
    let name: String?
    let bookmarked: Bool?
}
