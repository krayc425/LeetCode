class Solution {
    let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let m = board.count
        let n = board[0].count
        var step = 0
        var visited = Set<[[Int]]>(arrayLiteral: board)
        var queue = [[[Int]]](arrayLiteral: board)
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let first = queue.removeFirst()
                if first == [[1,2,3],[4,5,0]] {
                    return step
                }
                let zeroRow = first[0].contains(0) ? 0 : 1
                let zeroCol = first[zeroRow].firstIndex(of: 0)!
                for d in directions {
                    let swapRow = zeroRow + d.0
                    let swapCol = zeroCol + d.1
                    if swapRow >= 0 && swapRow < m && swapCol >= 0 && swapCol < n {
                        var newBoard = first
                        newBoard[zeroRow][zeroCol] = newBoard[swapRow][swapCol]
                        newBoard[swapRow][swapCol] = 0
                        if !visited.contains(newBoard) {
                            visited.insert(newBoard)
                            queue.append(newBoard)
                        }
                    }
                }
            }
            step += 1
        }
        return -1
    }
}
