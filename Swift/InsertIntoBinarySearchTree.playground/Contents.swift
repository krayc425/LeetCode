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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var node: TreeNode? = root
        while node != nil {
            if node!.val > val {
                if let left = node!.left {
                    node = left
                } else {
                    node!.left = TreeNode(val)
                    return root
                }
            } else {
                if let right = node!.right {
                    node = right
                } else {
                    node!.right = TreeNode(val)
                    return root
                }
            }
        }
        return nil
    }
}
