//
//  DetailsNewsView.swift
//  NewsMVVMSWUI
//
//  Created by Jose Preatorian on 01-02-26.
//


import SwiftUI

struct DetailsNewsView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {

                        NewsImage(url: article.urlToImage, width: 300, height: 200)

                        if article.urlToImage == nil {
                            NewsImage(url: nil, width: 300, height: 200)
                        }
                    }
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 12) {

                    Text(article.title)
                        .font(.title2.bold())

                    HStack {
                        Label(article.source.name, systemImage: "newspaper.fill")
                            .foregroundColor(.blue)
                        
                        Text("•")
                        
                        Text(article.publishedAt.prefix(10))
                        
                        if let author = article.author {
                            Text("•")
                            Text(author).lineLimit(1)
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
   
                    Text("Resumen")
                        .font(.headline)
                    
                    Text(article.description ?? "No hay descripción disponible para esta noticia.")
                        .font(.body)
                        .foregroundColor(.primary)

                    if let content = article.content {
                        Text("Contenido")
                            .font(.headline)
                            .padding(.top, 5)
                        
                        Text(content)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(5)
                    }

                    if let url = URL(string: article.url) {
                        Link(destination: url) {
                            HStack {
                                Text("Leer noticia completa")
                                Image(systemName: "safari")
                            }
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        .padding(.top, 20)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Noticia")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct NewsImage: View {
    let url: String?
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: url ?? "")) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .cornerRadius(12)
                    .clipped()
            case .failure:
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                }
                .frame(width: width, height: height)
                .cornerRadius(12)
            default:
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
    }
}

//#Preview {
//    DetailsNewsView()
//}
