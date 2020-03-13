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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return addLeafVal(root, isLeft: false)
    }
    
    func addLeafVal(_ root: TreeNode?, isLeft: Bool) -> Int {
        if root == nil {
            return 0
        } else {
            let root = root!
            if root.left == nil && root.right == nil {
                return isLeft ? root.val : 0
            } else {
                return addLeafVal(root.left, isLeft: true) + addLeafVal(root.right, isLeft: false)
            }
        }
    }
}

let node = TreeNode(1)
let node1 = TreeNode(2)
let node2 = TreeNode(3)
let node3 = TreeNode(4)
let node4 = TreeNode(5)
node.left = node1
node.right = node2
node2.left = node3
node2.right = node4

Solution().sumOfLeftLeaves(node)
