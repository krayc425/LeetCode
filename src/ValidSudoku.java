public class ValidSudoku {
    public boolean isValidSudoku(char[][] board) {
        // rows
        for (int i = 0; i < 9; i++) {
            if (!isValid(board[i])) {
                return false;
            }
        }
        // columns
        for (int i = 0; i < 9; i++) {
            char[] temp = new char[9];
            for (int j = 0; j < 9; j++) {
                temp[j] = board[j][i];
            }
            if (!isValid(temp)) {
                return false;
            }
        }
        // square
        for (int i = 0; i <= 6; i += 3) {
            for (int j = 0; j <= 6; j += 3) {
                char[] chars = {
                        board[i][j],
                        board[i + 1][j],
                        board[i + 2][j],
                        board[i][j + 1],
                        board[i + 1][j + 1],
                        board[i + 2][j + 1],
                        board[i][j + 2],
                        board[i + 1][j + 2],
                        board[i + 2][j + 2]
                };
                if (!isValid(chars)) {
                    return false;
                }
            }
        }
        return true;
    }

    private boolean isValid(char[] chars) {
        int[] count = new int[]{1, 1, 1, 1, 1, 1, 1, 1, 1};
        for (int i = 0; i < 9; i++) {
            if (chars[i] >= '0' && chars[i] <= '9') {
                count[chars[i] - 1 - '0']--;
                if (count[chars[i] - 1 - '0'] < 0) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        ValidSudoku validSudoku = new ValidSudoku();
        System.out.println(validSudoku.isValidSudoku(new char[][]{
                {'5', '3', '.', '.', '7', '.', '.', '.', '.'},
                {'6', '.', '.', '1', '9', '5', '.', '.', '.'},
                {'.', '9', '8', '.', '.', '.', '.', '6', '.'},
                {'8', '.', '.', '.', '6', '.', '.', '.', '3'},
                {'4', '.', '.', '8', '.', '3', '.', '.', '1'},
                {'7', '.', '.', '.', '2', '.', '.', '.', '6'},
                {'.', '6', '.', '.', '.', '.', '2', '8', '.'},
                {'.', '.', '.', '4', '1', '9', '.', '.', '5'},
                {'.', '.', '.', '.', '8', '.', '.', '7', '9'}
        }));
        System.out.println(validSudoku.isValidSudoku(new char[][]{
                {'.', '.', '4', '.', '.', '.', '6', '3', '.'},
                {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                {'5', '.', '.', '.', '.', '.', '.', '9', '.'},
                {'.', '.', '.', '5', '6', '.', '.', '.', '.'},
                {'4', '.', '3', '.', '.', '.', '.', '.', '1'},
                {'.', '.', '.', '7', '.', '.', '.', '.', '.'},
                {'.', '.', '.', '5', '.', '.', '.', '.', '.'},
                {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                {'.', '.', '.', '.', '.', '.', '.', '.', '.'}
        }));
        System.out.println(validSudoku.isValidSudoku(new char[][]{
                {'.', '.', '.', '.', '.', '.', '5', '.', '.'},
                {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                {'9', '3', '.', '.', '2', '.', '4', '.', '.'},
                {'.', '.', '7', '.', '.', '.', '3', '.', '.'},
                {'.', '.', '.', '.', '.', '.', '.', '.', '.'},
                {'.', '.', '.', '3', '4', '.', '.', '.', '.'},
                {'.', '.', '.', '.', '.', '3', '.', '.', '.'},
                {'.', '.', '.', '.', '.', '5', '2', '.', '.'}
        }));
    }
}
