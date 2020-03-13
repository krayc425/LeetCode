public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    var result: [Int] = []
    var prevNum: Int?
    var maxCount = -1
    var count = 0
    
    func findMode(_ root: TreeNode?) -> [Int] {
        traverse(root)
        return result
    }
    
    func handle(_ node: TreeNode) {
        // 看这个数是不是跟以前的一样
        if let prev = prevNum, prev == node.val {
            count += 1
        } else {
            count = 1
        }
        prevNum = node.val
        if count == maxCount {
            // 跟以前最大的一样，加入result列表里
            result.append(node.val)
        } else if count > maxCount {
            // 找到一个新的最大的，更新result为这个数
            maxCount = count
            result = [node.val]
        }
    }
    
    func traverse(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        traverse(node.left)
        handle(node)
        traverse(node.right)
    }
}

let node = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)

node.right = node2
node2.left = node3

Solution().findMode(node)
