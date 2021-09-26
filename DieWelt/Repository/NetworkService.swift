//
//  NetworkService.swift
//  DieWelt
//
//  Created by devtolife on 16.09.21.
//

import Foundation
class NetworkService {
    
    class func fetch(categorie: String, completion: @escaping ([News]?) ->()){
        print ("load data")
        guard let url = URL(string: ConectData().testLoadingEndpoint) else {return}
        print (url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        var bodyData: String = "flag=true"
        
        if(categorie != ""){
            print ("cat=\(categorie)")
            bodyData = "cat=\(categorie)"
        }else{
            print ("cat=all")
            bodyData = "cat=all"
        }
        
        request.httpBody = bodyData.data(using: .utf8)
        
        let dataTask = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            
            print (data!)
            print(String(data: data!,encoding: .utf8)!)
            
            do {
                if let d = data {
                    
                    let decodedJson = try JSONDecoder().decode([News].self, from: d)
                    //Closure for getting back result of fetch
                    completion(decodedJson)
                    
                } else {
                    print("NO DATA")
                }
            }catch{
                print("ERROR: \(error)")
            }
        }
        dataTask.resume()
    }
}

