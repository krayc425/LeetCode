class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        // only when the graph is connected with exactly `n - 1` edges
        // could it be a tree
        // if less, not connected
        // if more, loop exists
        guard edges.count == n - 1 else {
            return false
        }
        var childrenDict: [Int: [Int]] = [:]
        for edge in edges {
            childrenDict[edge[0], default: []].append(edge[1])
            childrenDict[edge[1], default: []].append(edge[0])
        }
        var visited = Set<Int>(arrayLiteral: 0)
        var queue: [Int] = [0]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            if let children = childrenDict[first] {
                for child in children {
                    if !visited.contains(child) {
                        visited.insert(child)
                        queue.append(child)
                    }
                }
            }
        }
        return visited.count == n
    }
}
