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
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else {
            return []
        }
        var dict: [Int: TreeNode?] = [root.val: root]
        process(root, &dict, Set(to_delete))
        return Array(dict.values.compactMap { $0 })
    }
    
    func process(_ node: TreeNode?, _ dict: inout [Int: TreeNode?], _ toDelete: Set<Int>) {
        guard let node = node else {
            return
        }
        let containsVal = toDelete.contains(node.val)
        if containsVal {
            dict[node.val] = nil
        }
        if let left = node.left {
            if containsVal {
                dict[left.val] = left
            }
            process(left, &dict, toDelete)
            if toDelete.contains(left.val) {
                node.left = nil
            }
        }
        if let right = node.right {
            if containsVal {
                dict[right.val] = right
            }
            process(right, &dict, toDelete)
            if toDelete.contains(right.val) {
                node.right = nil
            }
        }
    }
}

let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node1 = TreeNode(1, node2, node3)
Solution().delNodes(node1, [2])
