class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        guard let first = grid.first, !first.isEmpty else {
            return 0
        }
        let m = grid.count
        let n = first.count
        var grid = grid
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 || i == m - 1 || j == n - 1 {
                    if grid[i][j] == 0 {
                        dfs(i, j, m, n, &grid)
                    }
                }
            }
        }
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    dfs(i, j, m, n, &grid)
                    res += 1
                }
            }
        }
        return res
    }
    
    func dfs(_ i: Int, _ j: Int, _ m: Int, _ n: Int, _ grid: inout [[Int]]) {
        if i < 0 || j < 0 || i >= m || j >= n || grid[i][j] == 1 {
            return
        }
        grid[i][j] = 1
        dfs(i - 1, j, m, n, &grid)
        dfs(i + 1, j, m, n, &grid)
        dfs(i, j - 1, m, n, &grid)
        dfs(i, j + 1, m, n, &grid)
    }
}
