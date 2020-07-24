import UIKit


/*
 
 String Compression:
 Implement a method to perform basic string compression using the counts of repeated characters.
 
 For example, the string aabcccccaaa would become a2b1c5a3.
 If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a - z).
 */

//aabcccccaaa
//a2b1c5a3
func stringCompression (_ s : String) -> String{
    
    let a = Array(s)
    var i = 0
    var count = 0
    var resultString = ""
    for char in a {
        
        if  i + 1 > (a.count - 1){
            break
        }
        if char == a[i + 1] {
            count += 1
        } else {
            resultString.append(String(char) + String(count))
            count = 1
        }
        
        i += 1
    }
    
    
    
    return resultString
}

stringCompression("aabcccccaaa")
