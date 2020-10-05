class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var board = board
        let r = click[0], c = click[1]
        if board[r][c] == "M" {
            board[r][c] = "X"
            return board
        }
        bfs(&board, r, c)
        return board
    }
    
    func bfs(_ board: inout [[Character]], _ r: Int, _ c: Int) {
        if r < 0 || c < 0 || r >= board.count || c >= board.first!.count {
            return
        }
        if "XB12345678".contains(board[r][c]) {
            return
        }
        if board[r][c] == "M" {
            return
        }
        board[r][c] = "B"
        var mines = 0
        for i in -1...1 {
            for j in -1...1 {
                if i == 0 && j == 0 {
                    continue
                }
                if r + i >= 0 && c + j >= 0 && r + i < board.count && c + j < board.first!.count && board[r + i][c + j] == "M" {
                    mines += 1
                }
            }
        }
        if mines > 0 {
            board[r][c] = Character(String(mines))
            return
        }
        for i in -1...1 {
            for j in -1...1 {
                if i == 0 && j == 0 {
                    continue
                }
                bfs(&board, r + i, c + j)
            }
        }
        return
    }
}

Solution().updateBoard([["E", "E", "E", "E", "E"],
                        ["E", "E", "M", "E", "E"],
                        ["E", "E", "E", "E", "E"],
                        ["E", "E", "E", "E", "E"]], [3,0])
