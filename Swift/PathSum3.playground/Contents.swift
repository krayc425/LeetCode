
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        // 以本根节点为根结点的情况 + 以左节点为根结点的情况 + 以右节点为根结点的情况
        return process(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }
    
    func process(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var result = root.val == sum ? 1 : 0
        if let left = root.left {
            result += process(left, sum - root.val)
        }
        if let right = root.right {
            result += process(right, sum - root.val)
        }
        return result
    }
    
    func pathSum_prefixSum(_ root: TreeNode?, _ sum: Int) -> Int {
        var visited: [Int: Int] = [0: 1]
        var res: Int = 0
        process_prefixSum(root, sum, 0, &visited, &res)
        return res
    }
    
    func process_prefixSum(_ node: TreeNode?, _ sum: Int, _ prefixSum: Int, _ visited: inout [Int: Int], _ res: inout Int) {
        guard let node = node else {
            return
        }
        let currentSum = node.val + prefixSum
        res += visited[currentSum - sum] ?? 0
        visited[currentSum, default: 0] += 1
        process_prefixSum(node.left, sum, currentSum, &visited, &res)
        process_prefixSum(node.right, sum, currentSum, &visited, &res)
        visited[currentSum, default: 0] -= 1
    }
    
}

let node = TreeNode(10)
let node1 = TreeNode(5)
let node2 = TreeNode(-3)
let node3 = TreeNode(3)
let node4 = TreeNode(2)
let node5 = TreeNode(11)
let node6 = TreeNode(3)
let node7 = TreeNode(-2)
let node8 = TreeNode(1)
node.left = node1
node.right = node2
node2.right = node5
node1.left = node3
node1.right = node4
node4.right = node8
node3.left = node6
node3.right = node7

Solution().pathSum(node, 8)
