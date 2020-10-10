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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var res: [String] = []
        var queue: [TreeNode?] = []
        queue.append(root)
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                res.append(String(node.val))
                queue.append(node.left)
                queue.append(node.right)
            } else {
                res.append("NULL")
            }
        }
        return res.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        guard data != "NULL" else {
            return nil
        }
        let vals = data.split(separator: ",")
        let root = TreeNode(Int(vals[0])!)
        var queue: [TreeNode] = [root]
        var idx = 1
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if vals[idx] != "NULL" {
                let newNode = TreeNode(Int(vals[idx])!)
                node.left = newNode
                queue.append(newNode)
            }
            idx += 1
            if vals[idx] != "NULL" {
                let newNode = TreeNode(Int(vals[idx])!)
                node.right = newNode
                queue.append(newNode)
            }
            idx += 1
        }
        return root
    }
}
