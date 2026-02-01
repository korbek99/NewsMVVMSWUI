//
//  NewsViewModel.swift
//  NewsMVVMSWUI
//
//  Created by Jose Preatorian on 01-02-26.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""
    
    private let service: WebServicesNewsProtocol

    init(service: WebServicesNewsProtocol = WebServicesNews()) {
        self.service = service
    }

    var filteredArticles: [Article] {
        if searchText.isEmpty {
            return articles
        } else {
            return articles.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func fetchArticles() {

        guard !isLoading else { return }
        
        self.isLoading = true
        self.errorMessage = nil
        
        service.getArticles { [weak self] result in

            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let fetchedArticles):
                self.articles = fetchedArticles
                
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    private func handleError(_ error: NetworkError) {
        switch error {
        case .invalidURL:
            self.errorMessage = "La dirección de conexión no es válida."
        case .noData:
            self.errorMessage = "No se recibieron datos del servidor."
        case .decodingError:
            self.errorMessage = "Error al procesar la información de las noticias."
        case .serverError(let message):
            self.errorMessage = message
        }
    }
}
