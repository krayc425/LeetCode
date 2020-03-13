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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        var node = root
        if key > node!.val {
            node!.right = deleteNode(node!.right, key)
        } else if key < node!.val {
            node!.left = deleteNode(node!.left, key)
        } else {
            if node!.left == nil && node!.right == nil {
                node = nil
            } else if node?.right != nil {
                let succ = findSucc(node!)
                node?.val = succ
                node?.right = deleteNode(node?.right, succ)
            } else {
                let pred = findPred(node!)
                node?.val = pred
                node?.left = deleteNode(node?.left, pred)
            }
        }
        return node
    }
    
    private func findPred(_ root: TreeNode) -> Int {
        var node = root.left
        while node?.right != nil {
            node = node?.right
        }
        return node!.val
    }
    
    private func findSucc(_ root: TreeNode) -> Int {
        var node = root.right
        while node?.left != nil {
            node = node?.left
        }
        return node!.val
    }
}
