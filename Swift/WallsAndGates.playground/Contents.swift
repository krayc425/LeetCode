class Solution {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func wallsAndGates(_ rooms: inout [[Int]]) {
        guard !rooms.isEmpty && !rooms[0].isEmpty else {
            return
        }
        let m = rooms.count
        let n = rooms[0].count
        var queue: [(Int, Int)] = []
        for i in 0..<m {
            for j in 0..<n {
                if rooms[i][j] == 0 {
                    queue.append((i, j))
                }
            }
        }
        while !queue.isEmpty {
            let first = queue.removeFirst()
            for d in directions {
                let newI = first.0 + d.0
                let newJ = first.1 + d.1
                if newI < 0 || newJ < 0 || newI >= m || newJ >= n || rooms[newI][newJ] != 2147483647 {
                    continue
                }
                rooms[newI][newJ] = rooms[first.0][first.1] + 1
                queue.append((newI, newJ))
            }
        }
    }
}
