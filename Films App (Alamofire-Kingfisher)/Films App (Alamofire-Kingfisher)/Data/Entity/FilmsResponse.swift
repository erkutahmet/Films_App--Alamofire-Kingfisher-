//
//  FilmsResponse.swift
//  Films App (Alamofire-Kingfisher)
//
//  Created by Ahmet Erkut on 26.10.2023.
//

import Foundation

class FilmsResponse: Codable {
    var filmler: [Films]?
    var success: Int?
}
