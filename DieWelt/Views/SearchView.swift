//
//  SearchView.swift
//  DieWelt
//
//  Created by devtolife on 15.09.21.
//

import SwiftUI

struct SearchView: View{
    @Binding var isSearchActive: Bool
    @Binding var searchText: String
    var body: some View{
        HStack{
            TextField("Search ...", text: $searchText )
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.leading, 8)
                .transition(.move(edge: .trailing))
                .animation(.linear)
                .disableAutocorrection(true)
           
            Button(action: {
                if(searchText != ""){
                    searchText = ""
                }
            }, label: {
                Text("Clear").foregroundColor(Color.white)
            }).padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.linear)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var isSearchActive: Bool = true
    @State static var searchText: String = ""

    static var previews: some View {
        SearchView(isSearchActive: $isSearchActive, searchText: $searchText)
    }
}
