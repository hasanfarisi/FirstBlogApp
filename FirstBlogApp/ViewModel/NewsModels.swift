//
//  NewsModels.swift
//  FirstBlogApp
//
//  Created by mac on 10/6/24.
//

import Foundation
import Combine
import SwiftyJSON

class NewsModels:ObservableObject{
    @Published var data: [News] = []
    init(){
        let url = "https://67038dfdab8a8f89273096d2.mockapi.io/api/v2/articles"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) {(data, _,err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data:data!)
            let items = json.array!
            for i in items{
                let id = i["id"].stringValue
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let image = i["urlToImage"].stringValue
                let author = i["author"].stringValue
                let originalURL = i["url"].stringValue
                let publishAt = i["publishedAt"].stringValue
                let content = i["content"].stringValue
                let authorPhoto = i["authorPhoto"].stringValue
                let timePost = i["timePost"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News(id: id, title: title, description: description, image: image, author: author, originalURL: originalURL, publishAt: publishAt, content: content, timePost: timePost, authorPhoto: authorPhoto))
                }
            }
        }.resume()
    }
}
