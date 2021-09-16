//
//  Repository.swift
//  DieWelt
//
//  Created by devtolife on 14.09.21.
//

import Foundation
class Repository{

    func loadNewsFromServer(dc: DataController, categorie: String){
        
        
        NetworkService.fetch(categorie: categorie) { news in
            
            DispatchQueue.main.async {
                guard let news = news else{return}
                dc.dataLoadingResponse(data: news)
            }
        }
        
        //==============
        //==============
        //==============
//
//        print ("load data")
//        let url = URL(string: ConectData().testLoadingEndpoint)!
//        print (url)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        var bodyData: String = "flag=true"
//
//        if(categorie != ""){
//            print ("cat=\(categorie)")
//            bodyData = "cat=\(categorie)"
//        }else{
//            print ("cat=all")
//            bodyData = "cat=all"
//        }
//
//        request.httpBody = bodyData.data(using: .utf8)
//
//        let dataTask = URLSession.shared.dataTask(with: request){
//            (data, response, error) in
//
//            print (data!)
//            print(String(data: data!,encoding: .utf8)!)
//
//            do {
//                if let d = data {
//
//                    let decodedJson = try JSONDecoder().decode([News].self, from: d)
//
//                    DispatchQueue.main.async {
//
//                        dc.dataLoadingResponse(data: decodedJson)
//                    }
//
//                } else {
//                    print("NO DATA")
//                }
//            }catch{
//                print("ERROR")
//            }
//        }
//        dataTask.resume()
    }

    
}
