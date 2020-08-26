public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var res: [TreeNode?] = []
        var dict: [String: Int] = [:]
        helper(&dict, &res, root)
        return res
    }
    
    func helper(_ dict: inout [String: Int], _ res: inout [TreeNode?], _ node: TreeNode?) -> String {
        guard let node = node else {
            return "#"
        }
        let desc = "\(node.val) \(helper(&dict, &res, node.left)) \(helper(&dict, &res, node.right))"
        if let val = dict[desc] {
            if val == 1 {
                res.append(node)
            }
        }
        dict[desc, default: 0] += 1
        return desc
    }
}
