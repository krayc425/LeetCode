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
    func longestConsecutive(_ root: TreeNode?) -> Int {
        return process(root, nil, 0)
    }
    
    func process(_ node: TreeNode?, _ parent: TreeNode?, _ len: Int) -> Int {
        guard let node = node else {
            return len
        }
        var len = len
        if let parent = parent, node.val == parent.val + 1 {
            len += 1
        } else {
            len = 1
        }
        let leftlen = process(node.left, node, len)
        let rightlen = process(node.right, node, len)
        return max(len, max(leftlen, rightlen))
    }
}
