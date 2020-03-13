class TreeNode {
    var value: Int
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    convenience init(value: Int) {
        self.init(value: value, left: nil, right: nil)
    }
    
    init(value: Int, left: TreeNode?, right: TreeNode?) {
        self.value = value
        self.leftChild = left
        self.rightChild = right
    }
}

func preOrder(_ head: TreeNode?) {
    if let realHead = head {
        print(realHead.value)
        preOrder(head?.leftChild)
        preOrder(head?.rightChild)
    } else {
        return
    }
}

func inOrder(_ head: TreeNode?) {
    if let realHead = head {
        inOrder(head?.leftChild)
        print(realHead.value)
        inOrder(head?.rightChild)
    } else {
        return
    }
}

func postOrder(_ head: TreeNode?) {
    if let realHead = head {
        postOrder(head?.leftChild)
        postOrder(head?.rightChild)
        print(realHead.value)
    } else {
        return
    }
}

func levelOrder(_ head: TreeNode?) {
    if let realHead = head {
        var queue: [TreeNode] = [realHead]
        while !queue.isEmpty {
            let headNode = queue.removeFirst()
            print(headNode.value)
            if let left = headNode.leftChild {
                queue.append(left)
            }
            if let right = headNode.rightChild {
                queue.append(right)
            }
        }
    } else {
        return
    }
}

let nodeG = TreeNode(value: 7)
let nodeH = TreeNode(value: 8)
let nodeE = TreeNode(value: 5, left: nodeG, right: nodeH)
let nodeF = TreeNode(value: 6)
let nodeC = TreeNode(value: 3, left: nodeE, right: nodeF)
let nodeD = TreeNode(value: 4)
let nodeB = TreeNode(value: 2, left: nodeD, right: nil)
let nodeA = TreeNode(value: 1, left: nodeB, right: nodeC)

//print("PreOrder")
//preOrder(nodeA)
//print("InOrder")
//inOrder(nodeA)
//print("PostOrder")
//postOrder(nodeA)
//print("LevelOrder")
//levelOrder(nodeA)

func serialize(_ head: TreeNode?) -> String {
    var result = ""
    if let realHead = head {
        result.append("\(realHead.value)!")
        result.append(serialize(head?.leftChild))
        result.append(serialize(head?.rightChild))
        return result
    } else {
        return "#!"
    }
}

func deserialize(_ treeString: String) -> TreeNode? {
    func reversePreOrder(_ queue: inout [String]) -> TreeNode? {
        let value: String = queue.removeFirst()
        if value == "#" {
            return nil
        } else {
            let headNode: TreeNode = TreeNode(value: Int(value)!)
            headNode.leftChild = reversePreOrder(&queue)
            headNode.rightChild = reversePreOrder(&queue)
            return headNode
        }
    }
    
    var array = treeString.split(separator: "!").map { String($0) }
    var queue: [String] = []
    for i in 0..<array.count {
        queue.append(array[i])
    }
    return reversePreOrder(&queue)
}

let node2 = TreeNode(value: 3)
let node1 = TreeNode(value: 12, left: node2, right: nil)

//print("Serialize")
//let serializeString = serialize(node1)
//print(serializeString)
//print("Deserialize")
//let deserializeNode = deserialize(serializeString)
//print(levelOrder(deserializeNode))

func treeDepth(_ head: TreeNode?) -> Int {
    if let realNode = head {
        return max(treeDepth(realNode.leftChild), treeDepth(realNode.rightChild)) + 1
    } else {
        return 0
    }
}

func contains(treeA headA: TreeNode?, treeB headB: TreeNode?) -> Bool {
    func check(treeA headA: TreeNode?, treeB headB: TreeNode?) -> Bool {
        if headB == nil {
            return true
        }
        if headA == nil || headA!.value != headB!.value {
            return false
        }
        return check(treeA: headA?.leftChild, treeB: headB?.leftChild) && check(treeA: headA?.rightChild, treeB: headB?.rightChild)
    }
    return check(treeA: headA, treeB: headB) || check(treeA: headA?.leftChild, treeB: headB) || check(treeA: headA?.rightChild, treeB: headB)
}

//treeDepth(nodeA)
//contains(treeA: nodeA, treeB: nodeB)

func generateTree(from array: [Int]) -> TreeNode? {
    if array.count == 0 {
        return nil
    }
    if array.count == 1 {
        return TreeNode(value: array[0])
    }
    let mid = Int((array.count + array.count % 2) / 2)
    let head = TreeNode(value: array[mid])
    let left = generateTree(from: Array(array[0..<mid]))
    let right = generateTree(from: Array(array[(mid+1)...]))
    head.leftChild = left
    head.rightChild = right
    return head
}

//func validateGenerateTree(_ array: [Int]) {
//    return array == inOrder(generateTree(from: array))
//}

inOrder(generateTree(from: [1,2,3,4,5,6,7,8,9]))
