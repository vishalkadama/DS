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
                queue?.dequeue(left)
            }
            if let right = dequeue.right{
                queue?.dequeue(right)
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
        
        
    }
    
}


