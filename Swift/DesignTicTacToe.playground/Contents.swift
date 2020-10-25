class TicTacToe {

    var win: Int
    var rowSum: [[Int]]
    var colSum: [[Int]]
    var diagSum: [[Int]]

    /** Initialize your data structure here. */
    init(_ n: Int) {
        win = n
        rowSum = [[Int](repeating: 0, count: n), [Int](repeating: 0, count: n)]
        colSum = [[Int](repeating: 0, count: n), [Int](repeating: 0, count: n)]
        diagSum = [[0,0],[0,0]]
    }
    
    /** Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins. */
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let idx = player - 1
        rowSum[idx][row] += 1
        if rowSum[idx][row] == win {
            return player
        }
        colSum[idx][col] += 1
        if colSum[idx][col] == win {
            return player
        }
        if row == col {
            diagSum[idx][0] += 1
            if diagSum[idx][0] == win {
                return player
            }
        }
        if row == win - 1 - col {
            diagSum[idx][1] += 1
            if diagSum[idx][1] == win {
                return player
            }
        }
        return 0
    }
    
}

/**
 * Your TicTacToe object will be instantiated and called as such:
 * let obj = TicTacToe(n)
 * let ret_1: Int = obj.move(row, col, player)
 */
