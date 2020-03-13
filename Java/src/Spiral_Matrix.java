import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kray on 2016/12/28.
 */
public class Spiral_Matrix {

    public static void main(String[] args) {
        Spiral_Matrix spiral_matrix = new Spiral_Matrix();
        ArrayList<Integer> list = (ArrayList<Integer>) spiral_matrix.spiralOrder(new int[][]{
                {2, 3},
        });
        for (int i = 0; i < list.size(); i++) {
            System.out.print(list.get(i));
        }
    }

    public List<Integer> spiralOrder(int[][] matrix) {
        ArrayList<Integer> integers = new ArrayList<>();

        int m = matrix.length;
        if (m == 0) {
            return integers;
        }

        int n = matrix[0].length;
        if (n == 0) {
            return integers;
        }

        int top = 0;
        int left = 0;
        int down = m - 1;
        int right = n - 1;

        while (top <= down && left <= right) {
            for (int i = left; i <= right; i++) {
                integers.add(matrix[top][i]);
            }
            top++;
            for (int i = top; i <= down; i++) {
                integers.add(matrix[i][right]);
            }
            right--;
            if (top <= down) {
                for (int i = right; i >= left; i--) {
                    integers.add(matrix[down][i]);
                }
            }
            down--;
            if (left <= right) {
                for (int i = down; i >= top; i--) {
                    integers.add(matrix[i][left]);
                }
            }
            left++;
        }

        return integers;
    }
}
