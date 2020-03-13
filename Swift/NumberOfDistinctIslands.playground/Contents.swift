class Solution {
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty && !grid[0].isEmpty else {
            return 0
        }
        let m = grid.count
        let n = grid[0].count
        var seen: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var shapes = Set<[Int]>()
        for i in 0..<m {
            for j in 0..<n {
                var shape: [Int] = []
                process(i, j, m, n, 0, grid, &shape, &seen)
                // print(shape)
                if !shape.isEmpty {
                    shapes.insert(shape)
                }
            }
        }
        return shapes.count
    }
    
    func process(_ r: Int, _ c: Int, _ m: Int, _ n: Int, _ di: Int,
                 _ grid: [[Int]], _ shape: inout [Int], _ seen: inout [[Int]]) {
        if r < 0 || r >= m || c < 0 || c >= n || grid[r][c] == 0 || seen[r][c] == 1 {
            return
        }
        seen[r][c] = 1
        shape.append(di)
        process(r + 1, c, m, n, 1, grid, &shape, &seen)
        process(r - 1, c, m, n, 2, grid, &shape, &seen)
        process(r, c + 1, m, n, 3, grid, &shape, &seen)
        process(r, c - 1, m, n, 4, grid, &shape, &seen)
        shape.append(0)
    }
}

Solution().numDistinctIslands([[1,1,1,0,0],[1,1,0,0,1],[1,0,0,1,1],[0,0,1,1,1]])
