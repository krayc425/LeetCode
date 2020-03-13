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
    func flatten(_ root: TreeNode?) {
        var curr: TreeNode?
        process(root, &curr)
    }
    
    func process(_ node: TreeNode?, _ curr: inout TreeNode?) {
        if node == nil {
            return
        }
        let node = node!
        let left = node.left
        let right = node.right
        node.left = nil
        node.right = nil
        if curr != nil {
            curr?.right = node
        }
        curr = curr?.right
        process(left, &curr)
        process(right, &curr)
    }
}
