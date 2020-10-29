class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {
            return []
        }
        let r = matrix.count
        let c = matrix[0].count
        var res: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: c), count: r)
        var queue: [(Int, Int)] = []
        for i in 0..<r {
            for j in 0..<c {
                if matrix[i][j] == 0 {
                    res[i][j] = 0
                    queue.append((i, j))
                }
            }
        }
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            for direction in directions {
                let newR = first.0 + direction.0
                let newC = first.1 + direction.1
                if newR >= 0 && newR < r && newC >= 0 && newC < c && res[newR][newC] == Int.max {
                    res[newR][newC] = res[first.0][first.1] + 1
                    queue.append((newR, newC))
                }
            }
        }
        return res
    }
}

let matrix = [[0,0,0],[0,1,0],[0,0,0]]
Solution().updateMatrix(matrix)
