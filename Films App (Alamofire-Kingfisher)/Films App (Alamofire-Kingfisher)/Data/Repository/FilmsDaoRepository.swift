//
//  FilmsDaoRepository.swift
//  Films App (Draft Plan) MVVM
//
//  Created by Ahmet Erkut on 26.10.2023.
//

import Foundation
import RxSwift
import Alamofire

class FilmsDaoRepository {
    var filmsList = BehaviorSubject<[Films]>(value: [Films]())
    
    func filmsReload() {
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(FilmsResponse.self, from: data)
                    
                    if let list = response.filmler {
                        self.filmsList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
