class Solution {
    let directions = [(1,0),(0,1),(-1,0),(0,-1),(-1,-1),(1,1),(-1,1),(1,-1)]
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let N = grid.count
        guard N > 0 && grid[0][0] == 0 && grid[N - 1][N - 1] == 0 else {
            return 0
        }
        var arr = grid
        var count = 1
        var queue: [(Int, Int)] = [(0,0)]
        while !queue.isEmpty {
            var newQueue: [(Int, Int)] = []
            while !queue.isEmpty {
                let first = queue.removeFirst()
                if arr[first.0][first.1] == 1 {
                    continue
                }
                if first == (N - 1, N - 1) {
                    return count
                }
                arr[first.0][first.1] = 1
                for direction in directions {
                    let next = (first.0 + direction.0, first.1 + direction.1)
                    if (0..<N).contains(next.0) && (0..<N).contains(next.1) && arr[next.0][next.1] == 0 {
                        newQueue.append(next)
                    }
                }
            }
            count += 1
            queue = newQueue
        }
        return -1
    }
}
