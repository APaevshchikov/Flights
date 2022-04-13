//
//  LoadImageUseCase.swift
//  Flights
//
//  Created by Ars Paev on 12.04.2022.
//

import Foundation
import Combine

final class LoadImageUseCase {
    private let service = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    
    func loadImageFrom(urlString: String, completion: @escaping (Data) -> Void) {
        service.loadImageFrom(urlString: urlString)
            .sink(
                receiveCompletion: { _ in
                    
                },
                receiveValue: { image in
                    completion(image)
                }
            )
            .store(in: &cancellables)
    }
}
