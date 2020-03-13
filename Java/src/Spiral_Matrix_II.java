/**
 * Created by Kray on 2016/12/25.
 */
public class Spiral_Matrix_II {
    public static void main(String[] args) {
        Spiral_Matrix_II s = new Spiral_Matrix_II();
        int[][] result = s.generateMatrix(5);
        for (int i = 0; i < result.length; i++) {
            for (int j = 0; j < result[0].length; j++) {
                System.out.print(result[i][j] + " ");
            }
            System.out.println();
        }
    }

    public int[][] generateMatrix(int n) {
        int currentNum = 1;
        int[][] result = new int[n][n];
        int top = 0;
        int left = 0;
        int right = n - 1;
        int down = n - 1;
        while (currentNum <= n * n) {
            for (int i = left; i <= right; i++) {
                result[top][i] = currentNum++;
            }
            top++;
            for (int i = top; i <= down; i++) {
                result[i][right] = currentNum++;
            }
            right--;
            for (int i = right; i >= left; i--) {
                result[down][i] = currentNum++;
            }
            down--;
            for (int i = down; i >= top; i--) {
                result[i][left] = currentNum++;
            }
            left++;
        }
        return result;
    }
}
