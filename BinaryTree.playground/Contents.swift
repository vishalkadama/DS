import UIKit

var str = "Binary Tree"

str.append("vis")

protocol Queable {
    
    associatedtype ElementType
    
    func enqueue (_ element : ElementType)
    
    func dequeue (_ element : ElementType) -> ElementType?
    
    func head()-> ElementType?
    
    func tail()-> ElementType?
    
    func removeAllElements()
    
    func isEmpty() -> Bool
}

class Queues <T> : Queable {
    

    typealias ElementType = T
    
    private var elements : [T] = []
    
    func enqueue(_ element: T) {
        elements.append(element )
    }
    
    func dequeue(_ element: T)-> T? {
        if !elements.isEmpty {
            let ele = elements.removeFirst()
            print("\(ele)", terminator: " ")
            return  elements.removeFirst()
        }
        return nil
    }
    
    func head() -> T? {
        return  elements.first
    }
    
    func tail() -> T? {
        return elements.last
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func removeAllElements() {
        elements.removeAll()
    }
}

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

class BinaryTree <T: Comparable & CustomStringConvertible>
{
    private var rootNode : TreeNode<T>?
    private var queue : Queues<TreeNode<T>>?

    func insert(_ element : T){
        
        let node = TreeNode(value: element)
        
        if let rootNode = self.rootNode{
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
        
    }
    
    func insert(_ rootNode : TreeNode<T>, _ newNode : TreeNode<T>){
        
       if rootNode.value > newNode.value {
        
        if let leftnode = rootNode.left{
            self.insert(leftnode, newNode)
        }else {
            rootNode.left = newNode
        }
        
       } else {
        if let rightNode = rootNode.right{
            self.insert(rightNode, newNode)
        }else {
            rootNode.right = newNode
        }
        }
    }
    
    func search(_ element : T){
        search(element,rootNode)
    }
    
    func search (_ element : T, _ rootNode : TreeNode<T>?){
        
        guard let rootNode = rootNode else { return}
        
        if element > rootNode.value {
            self.search(element, self.rootNode?.right)
        } else if element < rootNode.value {
            self.search(element, self.rootNode?.left)
        } else {
            print("Element not found")
        }
        
    }
    
   // For Reference --- https://www.youtube.com/watch?v=5dySuyZf9Qg
    // L N R
    func inorder(_ node : TreeNode<T>?){
        guard let _ = node else {return}
        self.inorder(node?.left)
        print("\(node!.value)", terminator: " ")
        self.inorder(node?.right)
    }
    
    // N L R
    func preorder(_ node : TreeNode<T>?){
        guard let _ = node else {return}
        print("\(node!.value)", terminator: " ")
        self.preorder(node?.left)
        self.preorder(node?.right)
    }
    
    // L R N
    func postorder(_ node : TreeNode<T>?){
        guard let _ = node else {return}
        self.postorder(node?.left)
        self.postorder(node?.right)
        print("\(node!.value)", terminator: " ")
       
    }
    
}

extension BinaryTree {
    // Level Order
    
    
    func levelOrder(){
        
        guard  let node = self.rootNode else { return }
        
        self.queue?.enqueue(node)
        
        while !((self.queue?.isEmpty())!) {
            
            guard let dequElement = self.queue?.dequeue(node) else { break}
            
            if let leftNode = dequElement.left{
                self.queue?.enqueue(leftNode)
            }
            if let rightNode = dequElement.right{
                self.queue?.enqueue(rightNode)
            }
        }
        
    }
    
    func findMaxElement(){
        guard let node = self.rootNode else {
            return
        }
        
        func findMax(_ node : TreeNode<T>?) -> Int?{
            
            guard let _ = node else { return nil }
            
            var leftMax = 0
            var rightMax = 0
            
            if let leftNode = node?.left {
                leftMax = max(leftMax, leftNode.value  as! Int)
                findMax(leftNode)
            }
            
            if let rightNode = node?.right {
                rightMax = max(rightMax, rightNode.value as! Int)
                findMax(rightNode)
            }
            
            leftMax = Int(max(leftMax, rightMax))
            return leftMax
        }
    }
    
    
    func findHeight(){
        guard let node = self.rootNode else {
            return
        }
        
        func getHeight(_ node : TreeNode<T>?) -> Int {
            guard let _ = node else { return -1 }
            return max(getHeight(node?.left), getHeight(node?.right)) + 1
        }
        
        getHeight(node)
    }
    
    func findMaxDepth(){
        var height = 0
        guard let node = self.rootNode else {
            return
        }
        func getDepth(_ node : TreeNode<T>?) -> Int {
            
            guard let _ = node else {return 0}
            
            let left = getDepth(node?.left)
            let right = getDepth(node?.right)
            
            if left > right {
                height = left + 1
            } else {
                height = right + 1
            }
            
            return height
        }
        getDepth(node)
    }
    
    func findHalfNodes() -> Int?{
        
        guard let node = rootNode else {
            return 0
        }
        var count = 0
        
        
        queue?.enqueue(node)
        
        while !(queue?.isEmpty())! {
            
            guard let dequeue = queue?.dequeue(node) else {
                break
            }
            
            if (dequeue.left != nil && dequeue.right == nil ) || (dequeue.right != nil && dequeue.left == nil ){
                count += 1
            }
            
            if let left = dequeue.left{
                queue?.enqueue(left)
            }
            if let right = dequeue.right{
                queue?.enqueue(right)
            }
        }
        return count
    }
    
    // [1,2,3,4,5,6]
    func constructMinimalTree(_ array : [Int]){
        
        func minimalTree(_ array : [Int], _ start : Int, _ end : Int ) -> TreeNode<Int>? {
            
            if start > end{
                return nil
            }
            let midpoint = (start + end) / 2
            
            let binaryTree = TreeNode<Int>(value: array[midpoint])
            binaryTree.left = minimalTree(array, start, midpoint-1)
            binaryTree.right = minimalTree(array, midpoint+1, end)
            return binaryTree
        }
        
        minimalTree(array, 0, array.count - 1)
        
        
    }
    
    
    
    
}

extension BinaryTree {
   
    
    /* Check Binary Tree Blanced */
    
    /* Blanced Tree : It is defined as " The depth of the left and right (subtrees) node never differ than one"
     
     1.The left and right subtrees' heights differ by at most one, AND
     2.The left subtree is balanced, AND
     3.The right subtree is balanced
     
     a
     / \
     b   c
     /
     d
     */
    
    //0(n^2) in worst case
    
    func checkBlancedTree(){
        
        guard let node = self.rootNode else {
            return
        }
        
        func isBlancedTree(_ nod : TreeNode<T>?)-> Bool{
            
            guard let node = nod else {
                return true
            }
            
            let left =  checkHeight(node.left)
            let right = checkHeight(node.right)
            
            let absValue = abs(left - right)
            if absValue <= 1 && isBlancedTree(node.left) && isBlancedTree(node.right) {
                return true
            }
            return false
        }
        
        func checkHeight(_ node : TreeNode<T>?) -> Int {
           
            guard let _ = node else {
                return 0
            }
           
            return max(checkHeight(node?.left), checkHeight(node?.right)) + 1
        }
        
    }
}


extension BinaryTree {
    
    // Validate BST: Implement a function to check if a binary tree is a binary search tree.
    
   
        
        func isValidBST(_ root: TreeNode<T>?) -> Bool{
          
            guard let node = root else {
                return false
            }
            
            func checkBST(_ node : TreeNode<T>?, minValue : Int, maxValue : Int)-> Bool{
                
                guard let root = node else { return true }
                
                if ((root.value as! Int) >= maxValue) || ( (root.value as! Int) <= minValue ) {
                    return false
                }
                
                let left = checkBST(root.left, minValue: minValue, maxValue: root.value as! Int)
                let right = checkBST(root.right, minValue: root.value as! Int, maxValue: maxValue)

                
                return left && right
            }
            
            checkBST(node, minValue: Int.min, maxValue: Int.max)
            
            return true
            
        }
        
      //  func checkBST(_ n : TreeNode<T>?) -> Bool {}
   
    
    
    class Solution {
        
         class TreeNode {
            public var val: Int
            public var left: TreeNode?
            public var right: TreeNode?
            public init() { self.val = 0; self.left = nil; self.right = nil; }
            public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
            public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
                self.val = val
                self.left = left
                self.right = right
            }
        }
        
    
        
//        var maxValue = Int.min
//        var result = Int.min
//        func maxPathSum(_ root: TreeNode?) -> Int {
//            
//            guard let node = root else { return 0}
//            
//            func checkMaxValue (_ root : TreeNode?) -> Int{
//                guard let node = root else { return 0}
//                
//               
//                
//                let left = checkMaxValue(node.left)
//                let right = checkMaxValue(node.right)
//                
//                maxValue = max(max(left, right), node.val)
//                maxValue = max(maxValue, left + right + node.val)
//                result = max(maxValue, result)
//                
//                return result
//            }
//            
//            checkMaxValue (node)
//            return maxValue
//        }
        
    }
    
    
}
