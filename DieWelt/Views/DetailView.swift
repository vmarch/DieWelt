//
//  DetailView.swift
//  DieWelt
//
//  Created by Student on 14.09.21.
//

import SwiftUI
struct DetailView: View {
    @State var article: News = News(id: 0, headline: "", subline: "", source: "", textmessage: "", published: "", image: "", categorie: "")
   
    var body: some View {
        ZStack{
            Color("BlueMarine").ignoresSafeArea()
            
        Text("\(article.headline)")
        }
    }
}
