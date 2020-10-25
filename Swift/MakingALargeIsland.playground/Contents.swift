class Solution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        guard let first = grid.first, !first.isEmpty else {
            return 0
        }
        let m = grid.count
        let n = first.count
        var grid = grid
        var res = 0
        var hasZero = false
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    continue
                }
                hasZero = true
                var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
                grid[i][j] = 1
                res = max(res, dfs(i, j, m, n, &visited, grid))
                if res == m * n {
                    return res
                }
                grid[i][j] = 0
            }
        }
        return hasZero ? res : m * n
    }
    
    func dfs(_ i: Int, _ j: Int, _ m: Int, _ n: Int, _ visited: inout [[Bool]], _ grid: [[Int]]) -> Int {
        if i < 0 || j < 0 || i >= m || j >= n || visited[i][j] || grid[i][j] == 0 {
            return 0
        }
        visited[i][j] = true
        return 1
            + dfs(i + 1, j, m, n, &visited, grid)
            + dfs(i - 1, j, m, n, &visited, grid)
            + dfs(i, j + 1, m, n, &visited, grid)
            + dfs(i, j - 1, m, n, &visited, grid)
    }
}
