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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return judge(root, Int.min, Int.max)
    }
    
    func judge(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        if node == nil {
            return true
        }
        let node = node!
        if node.val <= min || node.val >= max {
            return false
        }
        return judge(node.left, min, node.val) && judge(node.right, node.val, max)
    }
}
