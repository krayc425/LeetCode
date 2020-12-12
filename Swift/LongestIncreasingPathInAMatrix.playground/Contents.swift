class Solution {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        guard let first = matrix.first, !first.isEmpty else {
            return 0
        }
        let m = matrix.count
        let n = first.count
        var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if visited[i][j] == 0 {
                    res = max(res, dfs(i, j, m, n, matrix, &visited))
                }
            }
        }
        return res
    }
    
    func dfs(_ i: Int, _ j: Int, _ m: Int, _ n: Int, _ matrix: [[Int]], _ visited: inout [[Int]]) -> Int {
        if visited[i][j] != 0 {
            return visited[i][j]
        }
        for d in directions {
            let newI = i + d.0
            let newJ = j + d.1
            if newI >= 0 && newJ >= 0 && newI < m && newJ < n && matrix[newI][newJ] > matrix[i][j] {
                visited[i][j] = max(visited[i][j], dfs(newI, newJ, m, n, matrix, &visited))
            }
        }
        visited[i][j] += 1
        return visited[i][j]
    }
}

