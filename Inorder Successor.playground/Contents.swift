import UIKit




class TreeNode<T> {
    
    var left : TreeNode?
    var right : TreeNode?
    var value : T
    
    init(value : T, left: TreeNode?=nil , right: TreeNode?=nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
}

func findSuccessor(_ r : TreeNode<Int>?){
    
    guard let node = r else {return }
    
    if node.right != nil {
        
    } else {
        
    }
   
    
    
}


