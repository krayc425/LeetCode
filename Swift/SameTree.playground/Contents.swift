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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }
        return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    func isSameTree_iterative(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }
        var queue: [TreeNode?] = []
        queue.append(contentsOf: [p, q])
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let second = queue.removeFirst()
            if first == nil && second == nil {
                continue
            }
            if first == nil || second == nil {
                return false
            }
            if first!.val != second!.val {
                return false
            }
            queue.append(contentsOf: [first!.left, second!.left, first!.right, second!.right])
        }
        return true
    }
}

let lnode1 = TreeNode(1)
let lnode2 = TreeNode(2)
let lnode3 = TreeNode(3)
lnode1.left = lnode2
lnode1.right = lnode3

let rnode1 = TreeNode(1)
let rnode2 = TreeNode(2)
let rnode3 = TreeNode(4)
rnode1.left = rnode2
rnode1.right = rnode3

print(Solution().isSameTree(lnode1, rnode1))
