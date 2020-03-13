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
    func printTree(_ root: TreeNode?) -> [[String]] {
        let height = getHeight(root)
        let width = 1 << height - 1
        var res: [[String]] = Array(repeating: Array(repeating: "", count: width), count: height)
        fill(&res, root, 0, 0, width)
        return res
    }
    
    private func fill(_ res: inout [[String]], _ node: TreeNode?, _ height: Int, _ l: Int, _ r: Int) {
        guard let node = node else {
            return
        }
        let mid = (l + r) / 2
        res[height][mid] = String(node.val)
        fill(&res, node.left, height + 1, l, mid)
        fill(&res, node.right, height + 1, mid, r)
    }
    
    private func getHeight(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return 1 + max(getHeight(root.left), getHeight(root.right))
    }
}
