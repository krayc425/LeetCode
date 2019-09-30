public class Unique_Paths_2 {
    public int uniquePathsWithObstacles(int[][] obstacleGrid) {
        int m = obstacleGrid.length;
        int n = obstacleGrid[0].length;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (obstacleGrid[i][j] == 1) {
                    obstacleGrid[i][j] = -1;
                }
            }
        }
        for (int i = 0; i < m; i++) {
            if (obstacleGrid[i][0] == -1) {
                break;
            } else {
                obstacleGrid[i][0] = 1;
            }
        }
        for (int i = 0; i < n; i++) {
            if (obstacleGrid[0][i] == -1) {
                break;
            } else {
                obstacleGrid[0][i] = 1;
            }
        }
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                if (obstacleGrid[i][j] != -1) {
                    obstacleGrid[i][j] = (obstacleGrid[i - 1][j] == -1 ? 0 : obstacleGrid[i - 1][j])
                            + (obstacleGrid[i][j - 1] == -1 ? 0 : obstacleGrid[i][j - 1]);
                }
            }
        }
        return obstacleGrid[m - 1][n - 1] == -1 ? 0 : obstacleGrid[m - 1][n - 1];
    }

    public static void main(String[] args) {
        Unique_Paths_2 unique_paths_2 = new Unique_Paths_2();
        System.out.println(unique_paths_2.uniquePathsWithObstacles(new int[][]{
                {0, 0, 0},
                {0, 1, 0},
                {0, 0, 0}
        }));
    }
}
