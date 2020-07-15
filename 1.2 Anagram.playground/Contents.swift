import UIKit

var str = "Hello, playground"


/*
 Check Permutation:
 
 Given two strings,
 write a method to decide if one is a permutation of the other.
 */

// Contains Same chars in both the given elements


func sameCharInTwoStrings(s1 : String, s2 : String) -> Bool{
    
    guard s1.count == s2.count else {
        return false
    }
    let turple = s1.map {($0,1)}
    var dict = Dictionary (turple, uniquingKeysWith: +)
    var dictValue = 0
    for char in s2 {
        print(char)
        if  (dict[char] != nil) {
            print(dictValue)
            dictValue = dict[char] ?? 0
            dictValue -= 1
            dict.updateValue(dictValue, forKey: char)
        } else {
            return false
        }
    }
    
   return dict.filter {$0.value >= 1}.count > 1 ? false : true
}

func sameChar(s1 : String, s2 : String) -> Bool{
    
    guard s1.count == s2.count else {
        return false
    }
    
    if s1.sorted() == s2.sorted() {
        return true
    } else {
        return false
    }
    
    return false
}


func sameCharDict(s1: String, s2: String) -> Bool{
    
    let turple = s1.map {($0,1)}
    let dict = Dictionary (turple, uniquingKeysWith: +)
    
    let turple2 = s2.map {($0,1)}
     let dict2 = Dictionary (turple2, uniquingKeysWith: +)
    
    if dict == dict2 {
        return true
    } else {
        return false
    }
    
}

sameCharDict(s1: "vishal", s2: "lahisv")

sameChar(s1: "vishal", s2: "lahisv")

sameCharInTwoStrings(s1: "vishal", s2: "lahisv")
