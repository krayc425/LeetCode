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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var list: [Int] = []
        inorder(root, &list)
        var head = 0
        var rear = list.count - 1
        while head < rear {
            let sum = list[head] + list[rear]
            if sum == k {
                return true
            } else if sum < k {
                head += 1
            } else {
                rear -= 1
            }
        }
        return false
    }
    
    func inorder(_ root: TreeNode?, _ list: inout [Int]) {
        if let root = root {
            inorder(root.left, &list)
            list.append(root.val)
            inorder(root.right, &list)
        }
    }
}
