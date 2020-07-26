//
//  DATA.swift
//  LK_Mirea
//
//  Created by Mikhail Kolkov  on 23.07.2020.
//  Copyright © 2020 MKM.LLC. All rights reserved.
//

import Foundation
import Combine
import Firebase

struct TimeTable: Identifiable {
    
    var id: Int
    var subject_name: String
    var teacher: String
    var clas: String
    var time: String
    
}
var data = [
    TimeTable(id: 0, subject_name: "Математический анализ", teacher: "Игонина Т.Р", clas: "А-18", time: "9:00 - 10:40"),
    TimeTable(id: 1, subject_name: "Линейная алгебра", teacher: "Берков Н.А", clas: "А-9", time: "10:50 - 12:10"),
    TimeTable(id: 2, subject_name: "Физика", teacher: "Сафронов А.А", clas: "А-17", time: "13:10 - 14:40")
]

struct TimeTable1: Identifiable {
    
    var id: Int
    var subject_name: String
    var teacher: String
    var clas: String
    var time: String
    
}
var data1 = [
    TimeTable1(id: 0, subject_name: "Математический анализ", teacher: "Игонина Т.Р", clas: "А-18", time: "9:00 - 10:40"),
    TimeTable1(id: 1, subject_name: "Физика", teacher: "Сафронов", clas: "А-17", time: "10:50 - 12:10"),
    TimeTable1(id: 2, subject_name: "ООП", teacher: "Рогонова", clas: "ИВЦ-2", time: "13:10 - 14:40")
]

struct Materials: Identifiable {
    var id: Int
    var name: String
}
var material = [
    Materials(id: 0, name: "Математический анализ 1-ый семестр"),
    Materials(id: 1, name: "Математический анализ 2-ой семестр")
    
]
/*class getData: ObservableObject {
    @Published var data = [DataType]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("Classes").getDocuments { (snap, err) in
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id  = i.documentID
                let name = i.get("name") as! String
                let image = i.get("image") as! URL
                
                self.data.append(DataType(id: id, name: name, image: image))
            }
        }
    }
    
} */
struct DataType: Identifiable {
    var id: String
    var name: String
    var image: URL
}
