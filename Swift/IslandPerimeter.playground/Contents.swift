class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let result = grid.flatMap { $0 }.filter { $0 == 1 }.count * 4
        var continuousOnes = 0
        for arr in grid {
            for j in 0..<arr.count - 1 {
                if arr[j] == 1 && arr[j + 1] == 1 {
                    continuousOnes += 1
                }
            }
        }
        for i in 0..<grid[0].count {
            for j in 0..<grid.count - 1 {
                if grid[j][i] == 1 && grid[j + 1][i] == 1 {
                    continuousOnes += 1
                }
            }
        }
        return result - continuousOnes * 2
    }
}
