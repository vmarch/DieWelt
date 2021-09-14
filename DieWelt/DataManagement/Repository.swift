//
//  Repository.swift
//  DieWelt
//
//  Created by Student on 14.09.21.
//

import Foundation
class Repository{

    func loadDataFromServer(dc: DataController, categorie: Categorie){
        print ("load data")
        let url = URL(string: ConectData().testLoadingEndpoint)!
        print (url)
        let dataTask = URLSession.shared.dataTask(with: url){
            (data, response, error) in
            
            print (data!)
            print(String(data: data!,encoding: .utf8)!)
            
            do {
                if let d = data {
                    
                    let decodedJson = try JSONDecoder().decode([News].self, from: d)
                    
                    DispatchQueue.main.async {
                        dc.dataLoadingResponse(data: decodedJson)
                    }
                    
                } else {
                    print("NO DATA")
                }
            }catch{
                print("ERROR")
            }
        }
        dataTask.resume()
    }
    
    
}
