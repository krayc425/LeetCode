class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        let row = grid.count
        let col = grid[0].count
        func hashCode(_ i: Int, _ j: Int) -> Int {
            return i * col + j
        }
        let orangeCount = grid.flatMap { $0 }.filter { $0 != 0 }.count
        var rottenQueue: [(Int, Int)] = []
        var rottenSet: Set<Int> = Set<Int>()
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 2 {
                    rottenQueue.append((i, j))
                    rottenSet.insert(hashCode(i, j))
                }
            }
        }
        if rottenQueue.count == orangeCount {
            return 0
        }
        var res = -1
        while !rottenQueue.isEmpty {
            let count = rottenQueue.count
            for _ in 0..<count {
                let last = rottenQueue.removeFirst()
                for d in directions {
                    let newI = last.0 + d.0
                    let newJ = last.1 + d.1
                    let newHash = hashCode(newI, newJ)
                    if newI >= 0 && newJ >= 0 && newI < row && newJ < col
                        && grid[newI][newJ] == 1 && !rottenSet.contains(newHash) {
                        rottenQueue.append((newI, newJ))
                        rottenSet.insert(newHash)
                    }
                }
            }
            res += 1
        }
        return rottenSet.count == orangeCount ? res : -1
    }
}

Solution().orangesRotting([[0,0,1,2],[2,0,1,1]])
