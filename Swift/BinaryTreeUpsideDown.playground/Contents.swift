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
    
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.left == nil {
            return root
        }
        let left = root.left
        let right = root.right
        let newNode = upsideDownBinaryTree(left)
        left?.left = right
        left?.right = root
        root.left = nil
        root.right = nil
        return newNode
    }
    
}
