//
//  DogApiManager.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/15.
//

import Foundation

 struct CatApiManager {
    
    func fetchImage(completion: @escaping (_ items: ImageDatum) -> Void) {
        let apiKey = APIKEY.seo.getApiKey
        let baseURL = "https://api.thecatapi.com/v1/images/search"
        
        //공용
        var urlComponent = URLComponents(string: baseURL)
        let keyQuery = URLQueryItem(name: "key", value: apiKey)

        let maxResults = URLQueryItem(name: "limit", value: "1") //이미지 갯수
        
        let items: [URLQueryItem] = [keyQuery,maxResults]
        urlComponent?.queryItems = items
        
        guard let url = urlComponent?.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching CatImage data")
                return
            }
            
            do {
                let res = try JSONDecoder().decode(ImageData.self, from: data)
                guard let fetchData = res.first else { return }
                completion(fetchData)
            } catch {
                print(error.localizedDescription)
                print(error)
            }
        }
        task.resume()
    }

}
