class Solution {
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid.first!.count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var res = Int.min
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] != 0 {
                    res = max(res, search(i, j, m, n, grid, &visited, grid[i][j]))
                }
            }
        }
        return res
    }
    
    func search(_ i: Int, _ j: Int, _ m: Int, _ n: Int,
                _ grid: [[Int]], _ visited: inout [[Bool]], _ value: Int) -> Int {
        visited[i][j] = true
        var curr = value
        for (r, c) in [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)] {
            if r >= 0 && r < m && c >= 0 && c < n && !visited[r][c] && grid[i][j] != 0 {
                curr = max(curr, search(r, c, m, n, grid, &visited, value + grid[r][c]))
            }
        }
        visited[i][j] = false
        return curr
    }
    
}

Solution().getMaximumGold([[0,6,0],[5,8,7],[0,9,0]])
