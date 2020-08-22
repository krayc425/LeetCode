class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        guard !board.isEmpty else {
            return
        }
        let direction = [0, -1, 1]
        let r = board.count
        let c = board[0].count
        for i in 0..<r {
            for j in 0..<c {
                var liveNeighbors = 0
                for m in 0..<3 {
                    for n in 0..<3 {
                        if m == 0 && n == 0 {
                            continue
                        }
                        let ci = i + direction[m]
                        let cj = j + direction[n]
                        if ci >= 0 && ci < r && cj >= 0 && cj < c && abs(board[ci][cj]) == 1 {
                            liveNeighbors += 1
                        }
                    }
                }
                
                if board[i][j] == 1 && (liveNeighbors < 2 || liveNeighbors > 3) {
                    board[i][j] = -1
                }
                if board[i][j] == 0 && liveNeighbors == 3 {
                    board[i][j] = 2
                }
            }
        }
        for i in 0..<r {
            for j in 0..<c {
                if board[i][j] > 0 {
                    board[i][j] = 1
                } else {
                    board[i][j] = 0
                }
            }
        }
    }
}

var board = [
  [0,1,0],
  [0,0,1],
  [1,1,1],
  [0,0,0]
]
Solution().gameOfLife(&board)
print(board)
