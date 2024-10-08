//
//  News.swift
//  FirstBlogApp
//
//  Created by mac on 10/6/24.
//
import Foundation

struct News:Codable,Identifiable{
    var id:String
    var title:String
    var description:String
    var image:String
    var author:String
    var originalURL:String
    var publishAt:String
    var content:String
    var timePost:String
    var authorPhoto:String
}
