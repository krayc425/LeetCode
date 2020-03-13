class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var board = grid.map { $0.map { $0.wholeNumberValue! } }
        let m = board.count
        guard m > 0 else {
            return 0
        }
        let n = board[0].count
        guard n > 0 else {
            return 0
        }
        var count = 0;
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == 1 {
                    count -= 1
                    process(&board, count, i, j, m, n)
                }
            }
        }
        return -count
    }
    
    func process(_ board: inout [[Int]], _ count: Int, _ i: Int, _ j: Int, _ m: Int, _ n: Int) {
        if i < 0 || j < 0 || i >= m || j >= n || board[i][j] != 1 {
            return
        }
        board[i][j] += count
        process(&board, count, i - 1, j, m, n)
        process(&board, count, i + 1, j, m, n)
        process(&board, count, i, j - 1, m, n)
        process(&board, count, i, j + 1, m, n)
    }
}

Solution().numIslands([["1","1","1","1","0"],
                       ["1","1","0","1","0"],
                       ["1","1","0","0","0"],
                       ["0","0","1","0","1"]])
