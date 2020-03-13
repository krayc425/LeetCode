class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        let row = board.count
        let col = board[0].count
        for i in 0..<row {
            for j in 0..<col {
                if find(i, j, board, word, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func find(_ row: Int, _ col: Int, _ board: [[Character]], _ word: String, _ length: Int) -> Bool {
        if length >= word.count {
            return true
        }
        if row < 0 || row >= board.count ||
            col < 0 || col >= board[0].count {
            return false
        }
        let char = word[word.index(word.startIndex, offsetBy: length)]
        if board[row][col] == "-" || char != board[row][col] {
            return false
        }
        var board = board
        board[row][col] = "-";
        let res = find(row + 1, col, board, word, length + 1) ||
                    find(row, col + 1, board, word, length + 1) ||
                    find(row - 1, col, board, word, length + 1) ||
                    find(row, col - 1, board, word, length + 1)
        return res
    }
}

let board: [[Character]] = [
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
];
print(Solution().exist(board, "ABCCEE"))
