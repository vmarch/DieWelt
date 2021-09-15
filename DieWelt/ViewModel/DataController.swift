//
//  DataController.swift
//  DieWelt
//
//  Created by Student on 14.09.21.
//

import SwiftUI
class DataController: ObservableObject{
    
    let repository: Repository = Repository()
    
    @Published var viewSelector: ViewSelector = .main
    @Published var lookingAs: LookingAs = .list
    @Published var categorie: Categorie = .sport
    @Published var aData:[News] = []
    
    init(){}

    func loadData(){
        repository.loadDataFromServer(dc: self, categorie: categorie)
    }
    
    func dataLoadingResponse(data: [News]){
        print(data)
        self.aData = data
    }
}
