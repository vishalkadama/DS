import UIKit


/*
 
 One Away: There are three types of edits that can be performed on strings:
 insert a character, remove a character, or replace a character.
 Given two strings, write a function to check if they are one edit (or zero edits) away.
 EXAMPLE
 pale, pIe -> true
 pales. pale -> true
 pale. bale -> true
 pale. bake -> false
 
 */


func keyValueCount(_ s : String) -> Dictionary<Character, Int> {
    let turple = s.lowercased().map {($0, 1)}
    let dict = Dictionary(turple, uniquingKeysWith: +)
    return dict
}

func oneAway(_ s1: String, _ s2 : String) -> Bool{
    
    let dict1 = keyValueCount(s1)
    let dict2 = keyValueCount(s2)
    var count = 0
    for char in dict1 {
        
        if dict2[char.key] != nil {
            
            if dict2[char.key] != char.value {
                count += 1
            }
            
        } else {
            count += 1
        }
        
    }
    
   return count <= 1 ? true : false
}
oneAway("pale", "pLe")
