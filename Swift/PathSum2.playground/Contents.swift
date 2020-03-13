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
    typealias ResultType = ([Int], Bool)
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var result: [[Int]] = []
        var path: [Int] = []
        process(root, sum, &path, &result)
        return result
    }
    
    func process(_ node: TreeNode?, _ sum: Int, _ path: inout [Int], _ result: inout [[Int]]) {
        if node == nil {
            return
        }
        let node = node!
        path.append(node.val)
        if node.left == nil && node.right == nil && node.val == sum {
            // 是叶节点且符合pathSum要求，加入结果
            result.append(path)
        } else {
            // 处理左边和右边
            process(node.left, sum - node.val, &path, &result)
            process(node.right, sum - node.val, &path, &result)
        }
        // 回溯
        path.removeLast()
    }
    
}
