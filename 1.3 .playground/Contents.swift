import UIKit

var str = "Hello, playground"


/*
 
 URLify:
 Write a method to replace all spaces in a string with '%20:
 You may assume that the string has sufficient space at the end to hold the additional characters,
 and that you are given the "true" length of the string.
 (Note: If implementing in Java, please use a character array so that you can perform this operation in place.)


 EXAMPLE
 Input: "Mr John Smith"
 Output: "Mr%20John%20Smith"
 
 */




func replaceWith20(_ s : String)-> String{
    var temp = ""
    for char in s {
        
        if char == " " {
            temp += "%20"
        } else {
            temp += char.description
        }
    }
    
    return temp
}


replaceWith20("Mr John Smith")
