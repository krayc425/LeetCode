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
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var arr: [Int] = []
        process(root, &arr)
        arr.sort()
        for i in 1..<arr.count {
            arr[i - 1] = arr[i] - arr[i - 1]
        }
        arr.removeLast()
        arr.sort()
        return arr[0]
    }
    
    func process(_ node: TreeNode?, _ arr: inout [Int]) {
        process(node?.left, &arr)
        if node != nil {
            arr.append(node!.val)
        }
        process(node?.right, &arr)
    }
}

let node    = TreeNode(1)
let node2   = TreeNode(2)
let node3   = TreeNode(3)
node.right = node2
node2.left = node3
Solution().getMinimumDifference(node)
