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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        process(root, &res, 0)
        return res
    }
    
    func process(_ node: TreeNode?, _ res: inout [Int], _ depth: Int) {
        guard let node = node else {
            return
        }
        if depth == res.count {
            res.append(node.val)
        }
        process(node.right, &res, depth + 1)
        process(node.left, &res, depth + 1)
    }
}
