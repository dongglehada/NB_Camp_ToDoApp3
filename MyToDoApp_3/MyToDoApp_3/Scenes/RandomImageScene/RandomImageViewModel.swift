//
//  RandomImageViewModel.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/15.
//

import Foundation

final class RandomImageViewModel{
    
    var viewUpdate : (_ url:URL) -> Void = {url in }
    
    private let apiManager = CatApiManager()
    
    func fetchImage(){
        apiManager.fetchImage { items in
            guard let url = URL(string: items.url) else {return}
            self.viewUpdate(url)
        }
    }
    
    
}


