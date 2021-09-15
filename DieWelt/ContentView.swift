//
//  ContentView.swift
//  DieWelt
//
//  Created by Student on 14.09.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dc:DataController = DataController()
    var body: some View {
        
        NavigationView{
            ZStack(){
                LinearGradient(gradient: Gradient(colors: [.blue,.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    if(dc.lookingAs == .grid){
                        Text("Create GridView")
                    }else{
                        List(dc.aData){ article in
                            NavigationLink(destination: DetailView(article: article), label: {
                                
                                VStack(spacing: 8){
                                    Image(uiImage: ImageLoader().loadImageFromURL(str: article.image))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 350)
                                        .padding(.vertical, 4)
                                    
                                    Text(article.headline)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                    Text(article.subline)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.7)
                                        .foregroundColor(.secondary)
                                    
                                    HStack{
                                        Text("\(article.published)")
                                        Spacer()
                                        Text("\(article.categorie)")
                                    }
                                }
                                
                            }
                            )
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
