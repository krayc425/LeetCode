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
    
    var res: [[Int]] = []
    
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        process(root)
        return res
    }
    
    func process(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return -1
        }
        let left = process(node.left)
        let right = process(node.right)
        let level = 1 + max(left, right)
        if res.count <= level {
            res.append([])
        }
        res[level].append(node.val)
        node.left = nil
        node.right = nil
        return level
    }
    
}
