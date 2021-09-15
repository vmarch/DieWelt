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
                
                VStack{
                    if(dc.lookingAs == .grid){
                        Text("Create GridView")
                    }else{
                        List(dc.aData){ article in
                            NavigationLink(destination: DetailView(article: article), label: {
                                
                                VStack(spacing: 8){
                                    Image(uiImage: ImageLoader().loadImageFromURL(str: article.image))
                                        .resizable()
                                        .scaledToFill()
                                    
                                        .padding(.vertical, 4)
                                    HStack{
                                       
                                            Text("\(article.categorie)")
                                                .fontWeight(.bold)
                                                .font(.system(size: 16, weight: .medium))
                                                .underline(true, color: .yellow)
                                                .textCase(.uppercase)
                                            
                                                .foregroundColor(Color("BlueMarine"))
                                               
                                            
                                    
                                        
                                        Spacer()
                                        Text("\(Date().getDateAsString(string: article.published))")
                                        
                                        
                                    }
                                    Text(article.headline)
                                        .fontWeight(.bold)
                                        .font(.system(size: 26, weight: .medium))
                                    //.lineLimit(1)
                                        .minimumScaleFactor(0.8)
                                    Text(article.subline)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.7)
                                        .foregroundColor(.secondary)
                                    Text(article.textmessage)
                                        .lineLimit(8)
                                    
                                }
                                
                            }
                            )
                            
                        }.onAppear {
                            self.dc.loadData()
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
