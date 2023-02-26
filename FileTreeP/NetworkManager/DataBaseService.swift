//
//  DataBaseService.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import FirebaseFirestore

class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    var homeRef: CollectionReference {
        return db.collection("Home")
    }
    
    //MARK: - Get File and Folder
    func getProducts(complition: @escaping (Result<[File], Error>) -> Void) {
        homeRef.getDocuments { qSnapsot, error in
            guard let qSnapsot = qSnapsot else {
                if let error = error {
                    complition(.failure(error))
                }
                return
            }
            let docs = qSnapsot.documents
            var files = [File]()
            for doc in docs {
                guard let file = File(doc: doc) else { return }
                files.append(file)
            }
            complition(.success(files))
        }
    }
}
