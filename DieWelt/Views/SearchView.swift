//
//  SearchView.swift
//  DieWelt
//
//  Created by devtolife on 15.09.21.
//

import SwiftUI

struct SearchView: View{
    @EnvironmentObject var dc:DataController
    var body: some View{
        HStack{
            TextField("Search ...", text: $dc.searchText)
                .modifier(SearchClearButton( myPadding: EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 8)))
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.leading, 8)
                .transition(.move(edge: .trailing))
                .animation(.linear)
                .disableAutocorrection(true)
           
            Button(action: {
                dc.isSearchActive = false
            }, label: {
                Text("Cancel").foregroundColor(Color.white)
            }).padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.linear)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
