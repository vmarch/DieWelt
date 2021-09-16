//
//  DetailView.swift
//  DieWelt
//
//  Created by devtolife on 14.09.21.
//

import SwiftUI
struct DetailView: View {

    @State var article: News = News(id: 0, headline: "", subline: "", source: "", textmessage: "", published: "", image: "", categorie: "")
    
    
    var body: some View {
        ZStack{
        Color("BlueMarine").ignoresSafeArea()
            VStack(spacing: 8){
                Image(uiImage: ImageLoader().loadImageFromURL(str: article.image))
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 4)
                HStack{
                    
                    Text("\(article.categorie)")
                        .fontWeight(.bold)
                        .font(.system(size: 16, weight: .medium))
                        .underline(true, color: .yellow)
                        .textCase(.uppercase)
                    
                        .foregroundColor(Color("BlueMarine"))
                    Text(article.subline)
                        .font(.subheadline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .foregroundColor(.secondary)
                    Spacer()
                    //    Text("\(Date().getDateAsString(string: article.published))")
                    
                }
                Text(article.headline)
                    .fontWeight(.bold)
                    .font(.system(size: 26, weight: .medium))
                //.lineLimit(1)
                
                Text(article.textmessage)
                    .fontWeight(.bold)
                    .font(.system(size: 14, weight: .medium))
                Spacer()
            }.padding()
                .background(Color.white)
            
        }
    }
}

