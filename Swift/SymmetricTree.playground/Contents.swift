
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return isEqual(root?.left, root?.right)
    }
    
    func isEqual(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil {
            return node2 == nil
        }
        if node2 == nil {
            return node1 == nil
        }
        return node1!.val == node2!.val && isEqual(node1!.left, node2!.right) && isEqual(node1!.right, node2!.left)
    }
}
    

let rnode1 = TreeNode(1)
let rnode2 = TreeNode(2)
let rnode3 = TreeNode(2)
rnode1.left = rnode2
rnode1.right = rnode3

print(Solution().isSymmetric(rnode1))
