class TicTacToe:

    def __init__(self, n: int):
        """
        Initialize your data structure here.
        """
        self.n = n
        self.rows = [[0] * n, [0] * n]
        self.cols = [[0] * n, [0] * n]
        self.diags = [[0, 0], [0, 0]]

    def move(self, row: int, col: int, player: int) -> int:
        """
        Player {player} makes a move at ({row}, {col}).
        @param row The row of the board.
        @param col The column of the board.
        @param player The player, can be either 1 or 2.
        @return The current winning condition, can be either:
                0: No one wins.
                1: Player 1 wins.
                2: Player 2 wins.
        """
        player -= 1
        self.rows[player][row] += 1
        self.cols[player][col] += 1
        if row == col:
            self.diags[player][0] += 1
        if row == self.n - col - 1:
            self.diags[player][1] += 1
        if self.rows[player][row] == self.n \
                or self.cols[player][col] == self.n \
                or self.diags[player][0] == self.n \
                or self.diags[player][1] == self.n:
            return player + 1
        return 0

# Your TicTacToe object will be instantiated and called as such:
# obj = TicTacToe(n)
# param_1 = obj.move(row,col,player)
