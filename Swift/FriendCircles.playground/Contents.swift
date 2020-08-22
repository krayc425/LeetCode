class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        guard !M.isEmpty else {
            return 0
        }
        var res = 0
        let count = M.count
        // This visited[i] element is used to indicate that the ith node
        // has already been visited while undergoing a dfs from some node.
        var visited: [Bool] = Array(repeating: false, count: count)
        for i in 0..<count {
            if !visited[i] {
                search(M, &visited, i)
                res += 1
            }
        }
        return res
    }
    
    func search(_ M: [[Int]], _ visited: inout [Bool], _ i: Int) {
        for j in 0..<visited.count {
            if M[i][j] == 1 && !visited[j] {
                visited[j] = true
                search(M, &visited, j)
            }
        }
    }
}

Solution().findCircleNum([[1,1,0], [1,1,0], [0,0,1]])
Solution().findCircleNum([[1,1,0], [1,1,1], [0,1,1]])
Solution().findCircleNum([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])
