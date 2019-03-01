import UIKit
import RealmSwift

class Dog: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
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
var realm : Realm? = nil

/**
    Configuration to udpdate changes in the Objects schemas of the database.
 
    - seealso:
    [Realm schemas migration]
    (https://realm.io/docs/swift/latest/#migrations)
 
 */
let config = Realm.Configuration(
    // Set the new schema version. This must be greater than the previously used
    // version (if you've never set a schema version before, the version is 0).
    schemaVersion: 1,
    
    // Set the block which will be called automatically when opening a Realm with
    // a schema version lower than the one set above
    migrationBlock: { migration, oldSchemaVersion in
        // We haven’t migrated anything yet, so oldSchemaVersion == 0
        if (oldSchemaVersion < 1) {
            // Nothing to do!
            // Realm will automatically detect new properties and removed properties
            // And will update the schema on disk automatically
        }
})

// Tell Realm to use this new configuration object for the default Realm

Realm.Configuration.defaultConfiguration = config

do{
    realm = try Realm()
}catch let error {
    print(error.localizedDescription)
}

let myDog = Dog()
myDog.id = 1
myDog.name = "Güero"


let puppies = realm?.objects(Dog.self)
let predicater = NSPredicate(format: "id == \(myDog.id)")
let update = true
if(puppies?.filter(predicater).count == 0 || update){
    try? realm?.write {
        realm?.add(myDog, update: update)
    }
}else{
    print("Error: A dog with the same id already exist, if you want upload please specifically")
}


print(puppies?.count ?? "No puppies found")

puppies?.forEach({ (dog) in
    print("Dog name: \(dog.name)")
})






