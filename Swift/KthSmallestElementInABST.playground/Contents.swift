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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = []
        var node = root
        var k = k
        while true {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            let last = stack.removeLast()
            if k == 1 {
                return last.val
            }
            k -= 1
            node = last.right
        }
    }
}
