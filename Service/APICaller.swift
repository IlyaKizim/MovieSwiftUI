//
//  APICaller.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import Foundation

class APICaller: MovieService {

    func fetchMovies(from endPoint: MovieListEndPoint, completion: @escaping (Result<TitleMovie, MovieError>) -> ()) {
        guard let url = URL(string: "\(Constants.basicURL)/3/movie/\(endPoint.rawValue)?api_key=\(Constants.APIKey)&language=en-US&page=1") else {
            completion(.failure(.invalidEndPoint))
            return
        }
        self.loadUrlAndDecode(url: url, completion: completion)
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Title, MovieError>) -> ()) {
        guard let url = URL(string: "\(Constants.basicURL)/movie/\(id)") else {
            completion(.failure(.invalidEndPoint))
            return
        }
        self.loadUrlAndDecode(url: url, params: [
            "append_to_responce": "video,credits"
        ], completion: completion)
    }
    
    func searchingMovies(query: String, completion: @escaping (Result<TitleMovie, MovieError>) -> ()) {
        guard let url = URL(string: "\(Constants.basicURL)/search/movie") else {
            completion(.failure(.invalidEndPoint))
            return
        }
        self.loadUrlAndDecode(url: url, params: [
            "language": "en-US",
            "include_adult": "false",
            "region": "US",
            "query": query
        ], completion: completion)
    }
    
    private func loadUrlAndDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping(Result<D, MovieError>) -> ()) {
//        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
//            completion(.failure(.invalidEndPoint))
//            return
//        }
//
//        var queryItem = [URLQueryItem(name: "api_key", value: Constants.APIKey)]
//
//        if let param = params {
//            queryItem.append(contentsOf: param.map { URLQueryItem(name: $0.key, value: $0.value)})
//        }
//
//        urlComponents.queryItems = queryItem
//
//        guard let finalUrl = urlComponents.url else {
//            completion(.failure(.invalidEndPoint))
//            return
//        }
        
        Constants.urlSession.dataTask(with: url) {[weak self] (data, responce, error) in
            guard let self = self else { return }
            if error != nil {
                self.executeCompletionhendlerMainThread(with: .failure(.apiError), completion: completion)
                return
            }
            
            guard let httpResponce = responce as? HTTPURLResponse, 200..<300 ~= httpResponce.statusCode else {
                self.executeCompletionhendlerMainThread(with: .failure(.invalidResponce), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionhendlerMainThread(with: .failure(.noData), completion: completion)
                return
            }
            
            do {
                let decoderResponce = try Constants.jsonDecoder.decode(D.self, from: data)
                self.executeCompletionhendlerMainThread(with: .success(decoderResponce), completion: completion)
            } catch {
                self.executeCompletionhendlerMainThread(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionhendlerMainThread<D: Decodable>(with result: Result<D, MovieError>, completion: @escaping(Result<D, MovieError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
