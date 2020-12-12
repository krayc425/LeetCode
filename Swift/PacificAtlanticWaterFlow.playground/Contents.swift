class Solution {
    let direction = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {
            return []
        }
        let m = matrix.count
        let n = matrix[0].count
        var pVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var aVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        var pQueue = [[Int]]()
        var aQueue = [[Int]]()
        for i in 0..<m {
            pQueue.append([i, 0])
            aQueue.append([i, n - 1])
            pVisited[i][0] = true
            aVisited[i][n - 1] = true
        }
        for i in 0..<n {
            pQueue.append([0, i])
            aQueue.append([m - 1, i])
            pVisited[0][i] = true
            aVisited[m - 1][i] = true
        }
        bfs(m, n, matrix, pQueue, &pVisited)
        bfs(m, n, matrix, aQueue, &aVisited)
        var res: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                if pVisited[i][j] && aVisited[i][j] {
                    res.append([i, j])
                }
            }
        }
        return res
    }
    
    func bfs(_ m: Int, _ n: Int, _ matrix: [[Int]], _ queue: [[Int]], _ visited: inout [[Bool]]) {
        var queue = queue
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for d in direction {
                let i = curr[0] + d[0]
                let j = curr[1] + d[1]
                if i < 0 || j < 0 || i >= m || j >= n || visited[i][j] || matrix[i][j] < matrix[curr[0]][curr[1]] {
                    continue
                }
                visited[i][j] = true
                queue.append([i, j])
            }
        }
    }
}
