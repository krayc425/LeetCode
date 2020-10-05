class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[String]] = []
        var board: [[Character]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        backtrack(&res, &board, 0, n)
        return res
    }
    
    func backtrack(_ res: inout [[String]], _ board: inout [[Character]], _ row: Int, _ n: Int) {
        if row == n {
            res.append(board.map { String($0) })
            return
        }
        for i in 0..<n {
            if !isValid(board, row, i, n) {
                continue
            }
            board[row][i] = "Q"
            backtrack(&res, &board, row + 1, n)
            board[row][i] = "."
        }
    }
    
    func isValid(_ board: [[Character]], _ row: Int, _ col: Int, _ n: Int) -> Bool {
        for i in 0..<n {
            if board[i][col] == "Q" {
                return false
            }
        }
        var i = row - 1, j = col + 1
        while true {
            if i < 0 || j == n {
                break
            }
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        i = row - 1
        j = col - 1
        while true {
            if i < 0 || j < 0 {
                break
            }
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        return true
    }
}

Solution().solveNQueens(4)
