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

extension TreeNode: Equatable {
    
    public static func ==(_ lhs: TreeNode, _ rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
    
}

extension TreeNode: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
}

class Solution {
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
        guard let root = root, let target = target else {
            return []
        }
        var parentMap: [TreeNode: TreeNode] = [:]
        fillParentDict(root, &parentMap)
        var level = 0
        var queue: [TreeNode] = [target]
        var visited: Set<TreeNode> = Set<TreeNode>()
        while !queue.isEmpty {
            if level == K {
                break
            }
            let count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                visited.insert(node)
                if let left = node.left, !visited.contains(left) {
                    queue.append(left)
                    visited.insert(left)
                }
                if let right = node.right, !visited.contains(right) {
                    queue.append(right)
                    visited.insert(right)
                }
                if let parent = parentMap[node], !visited.contains(parent) {
                    queue.append(parent)
                    visited.insert(parent)
                }
            }
            level += 1
        }
        return queue.map { $0.val }
    }
    
    func fillParentDict(_ node: TreeNode?, _ map: inout [TreeNode: TreeNode]) {
        guard let node = node else {
            return
        }
        if let left = node.left {
            map[left] = node
        }
        if let right = node.right {
            map[right] = node
        }
        fillParentDict(node.left, &map)
        fillParentDict(node.right, &map)
    }
    
}
