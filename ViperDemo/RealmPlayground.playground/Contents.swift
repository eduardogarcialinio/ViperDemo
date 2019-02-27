import UIKit
import RealmSwift

class Dog: Object {
    @objc dynamic var name : String! = ""
    @objc dynamic var age : Int! = 0
    @objc dynamic var id : Int! = 0
    
    convenience init(id: Int, name: String, age : Int){
        self.name = name
        self.age = age
        self.id = id
    }
}

//func deleteObject(fromObjects dbObjects : Results<Dog>, withName name : String){
//    let objectsToDelete = dbObjects?.filter("name == %@", name)
//
//    objectsToDelete?.forEach({ (object) in
//        print("Object: \(object)")
//    })
//
//    try? realm?.write {
//        guard let objects = objectsToDelete else {return}
//        realm?.delete(objects)
//    }
//}

var realm : Realm? = try? Realm()
try! realm?.write {
    realm?.deleteAll()
}
let myDog = Dog(id: 1, name: "Blanco", age: 3)


let puppies = realm?.objects(Dog.self)
print(puppies?.count ?? "No puppies found")

if(puppies?.filter("id == \(myDog.id)").count == 0){
    try? realm?.write {
        realm?.add(myDog)
    }
}else { print("Element with id: \(myDog.id) already exist")}

print(puppies?.count ?? "No puppies found")

puppies?.forEach({ (dog) in
    print("Dog name: \(dog.name)")
})




