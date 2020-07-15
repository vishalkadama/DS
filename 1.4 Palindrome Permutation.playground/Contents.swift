import UIKit


 /*
 
 Palindrome Permutation:
 Given a string, write a function to check if it is a permutation of a palin- drome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters.The palindrome does not need to be limited to just dictionary words.
 
 EXAMPLE
 Input: Tact Coa
 Output: True (permutations: "taco cat". "atco cta". etc.)
 */


func isPalindromePermutation(_ s : String)-> Bool{
    var count = 0
    var lowerCased = s.lowercased()
    lowerCased = lowerCased.replacingOccurrences(of: " ", with: "")
    
    let turple = lowerCased.map {($0,1)}
    let dict  = Dictionary(turple,uniquingKeysWith: +)
    
    dict.filter { (Int($0.value) % 2) == 0 }
    
    for value in dict.values {
        
        if ((value % 2) == 0){
            
        } else {
            count += 1
        }
    }
    
    return count <= 1 ? true : false
}
isPalindromePermutation("Tact Coa")
