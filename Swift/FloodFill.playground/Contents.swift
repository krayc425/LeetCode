class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if image[sr][sc] == newColor {
            return image
        }
        var grid = image
        let m = image.count
        let n = image[0].count
        process(&grid, sr, sc, image[sr][sc], newColor, m, n)
        return grid
    }
    
    func process(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ old: Int, _ new: Int, _ m: Int, _ n: Int) {
        if i < 0 || j < 0 || i >= m || j >= n {
            return
        }
        if grid[i][j] == old {
            grid[i][j] = new
            process(&grid, i - 1, j, old, new, m, n)
            process(&grid, i + 1, j, old, new, m, n)
            process(&grid, i, j - 1, old, new, m, n)
            process(&grid, i, j + 1, old, new, m, n)
        }
    }
}

Solution().floodFill([[0,0,0],[0,1,1]], 1, 1, 1)
