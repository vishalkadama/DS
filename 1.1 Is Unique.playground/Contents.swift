import UIKit

var str = "Hello, playground"


/* 1.1 Is Unique:
 Implement an algorithm to determine if a string has all unique characters.
 What if you cannot use additional data structures? */


extension String {
    
    func isUnique() -> Bool{
        var unique = Set<Character>()
        for char in self {
            if unique.contains(char){
                return false
            } else {
                unique.insert(char)
            }
        }
        return true
    }
    
    func isUniqueWithOutDataStructure()-> Bool{
           
        let turple = self.map {($0,1)}
        let dict = Dictionary(turple, uniquingKeysWith: +)
        return dict.filter {$0.value > 1}.count >= 1 ? false : true
        
       }
    
}

"vishall".isUnique()

"vishall".isUniqueWithOutDataStructure()
