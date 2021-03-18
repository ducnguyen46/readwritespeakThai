
import Foundation

class Category: NSObject{
    var id: Int = 0
    var name: String = ""
    var order: Int = 0
    
    func fromJson(_ json: [String: Any]) -> Category{
        if let id = json["id"] as? Int { self.id = id}
        if let name = json["name"] as? String {self.name = name}
        if let order = json["order"] as? Int {self.order = order}
        
        return self
    }
}
