//
//  DataController.swift
//  DieWelt
//
//  Created by devtolife on 14.09.21.
//

import SwiftUI
class DataController: ObservableObject{
    
    let repository: Repository = Repository()
    
    @Published var viewSelector: ViewSelector = .main
    @Published var lookingAs: LookingAs = .list
    @Published var categorieList: [String] = []
    @Published var currentCategorie: String = ""
    //politik
    //reise
    //sport
    //kultur
    //panorama
    //register
    //wirtschaft
    //event
    //auto
    
    
    
    private var aData:[News] = []
    @Published var aDataFiltered:[News] = []
    @Published var isSearchActive: Bool = false
    @Published var searchText: String = ""
    
    init(){
        loadData()
    }

    func loadData(){
        print("data loading started")
            repository.loadNewsFromServer(dc: self, categorie: currentCategorie)
    }
    
    func dataLoadingResponse(data: [News]){
        print(data)
        self.aData = data
        print("data loading finished")
        filterData()
    }
    
    func filterData(){
        aDataFiltered = []
        aDataFiltered = aData
        
        filterByTextInDownloadedList()
        print("aDataFilteredList = \(aDataFiltered.count)")
    }
    
    private func filterByTextInDownloadedList() {
        
        var tempFilteredList: [News] = []
        if(searchText.count > 0){
            for p in aDataFiltered{
                if(p.headline.lowercased().contains(searchText.lowercased())){
                    tempFilteredList.append(p)
                }
            }
        }else{
            tempFilteredList = aDataFiltered
        }
        aDataFiltered = tempFilteredList
    }
}
