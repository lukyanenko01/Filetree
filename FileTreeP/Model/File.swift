//
//  File.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import FirebaseFirestore

class File {
    
    var id: String
    var imageUrl: String = ""
    var title: String
    
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["imageUrl"] = self.imageUrl
        repres["title"] = self.title
        return repres
    }
    
    internal init(id: String = UUID().uuidString,
                  imageUrl: String = "",
                  title: String
                  ) {
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let imageUrl = data["imageUrl"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        
        self.id = id
        self.imageUrl = imageUrl
        self.title = title
    }
    
}
