class Solution {
    
    func solveSudoku(_ board: inout [[Character]]) {
        backtrack(&board)
    }
    
    func backtrack(_ board: inout [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    for k in "123456789" {
                        if valid(board, i, j, k) {
                            board[i][j] = k
                            if backtrack(&board) {
                                return true
                            }
                            board[i][j] = "."
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func valid(_ board: [[Character]], _ i: Int, _ j: Int, _ k: Character) -> Bool {
        for l in 0..<9 {
            if board[i][l] != "." && board[i][l] == k {
                return false
            }
            if board[l][j] != "." && board[l][j] == k {
                return false
            }
            let rowIndex = i / 3 * 3 + l / 3
            let colIndex = j / 3 * 3 + l % 3
            if board[rowIndex][colIndex] != "." && board[rowIndex][colIndex] == k {
                return false
            }
        }
        return true
    }

}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
Solution().solveSudoku(&board)
