class Solution {
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty || board[0].isEmpty {
            return
        }
        let h = board.count
        let w = board[0].count
        for i in 0..<h {
            if board[i][0] == "O" {
                edge(&board, i, 0, h, w)
            }
            if board[i][w - 1] == "O" {
                edge(&board, i, w - 1, h, w)
            }
        }
        for i in 0..<w {
            if board[0][i] == "O" {
                edge(&board, 0, i, h, w)
            }
            if board[h - 1][i] == "O" {
                edge(&board, h - 1, i, h, w)
            }
        }
        for i in 0..<h {
            for j in 0..<w {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
        for i in 0..<h {
            for j in 0..<w {
                if board[i][j] == "%" {
                    board[i][j] = "O"
                }
            }
        }
    }
    
    func edge(_ board: inout [[Character]], _ r: Int, _ c: Int, _ h: Int, _ w: Int) {
        if r < 0 || r >= h || c < 0 || c >= w || board[r][c] != "O" {
            return
        }
        board[r][c] = "%"
        edge(&board, r - 1, c, h, w)
        edge(&board, r + 1, c, h, w)
        edge(&board, r, c - 1, h, w)
        edge(&board, r, c + 1, h, w)
    }
}
