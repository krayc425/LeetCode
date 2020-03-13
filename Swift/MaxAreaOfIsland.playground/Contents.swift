class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty && !grid[0].isEmpty else {
            return 0
        }
        var grid = grid
        var res = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    res = max(res, findArea(&grid, i, j))
                }
            }
        }
        return res
    }
    
    private func findArea(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count || grid[i][j] != 1 {
            return 0
        }
        grid[i][j] = 0
        return 1 + findArea(&grid, i + 1, j) + findArea(&grid, i - 1, j) + findArea(&grid, i, j + 1) + findArea(&grid, i, j - 1)
    }
}

Solution().maxAreaOfIsland(
    [
        [0,0,1,0,0,0,0,1,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,1,1,0,0,0],
        [0,1,1,0,1,0,0,0,0,0,0,0,0],
        [0,1,0,0,1,1,0,0,1,0,1,0,0],
        [0,1,0,0,1,1,0,0,1,1,1,0,0],
        [0,0,0,0,0,0,0,0,0,0,1,0,0],
        [0,0,0,0,0,0,0,1,1,1,0,0,0],
        [0,0,0,0,0,0,0,1,1,0,0,0,0]
    ]
)
