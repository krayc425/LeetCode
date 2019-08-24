import java.util.HashMap;
import java.util.Map;

public class NumberOfBoomerangs {

    public int numberOfBoomerangs(int[][] points) {
        int result = 0;
        for (int i = 0; i < points.length; i++) {
            Map<Integer, Integer> distanceCount = new HashMap<>();
            for (int j = 0; j < points.length; j++) {
                if (i != j) {
                    int dx = points[i][0] - points[j][0];
                    int dy = points[i][1] - points[j][1];
                    int dis = dx * dx + dy * dy;
                    if (!distanceCount.containsKey(dis)) {
                        distanceCount.put(dis, 1);
                    } else {
                        distanceCount.put(dis, distanceCount.get(dis) + 1);
                    }
                }
            }

            for (int dis : distanceCount.keySet()) {
                int cnt = distanceCount.get(dis);
                if (cnt > 1) {
                    // C(n, 2) = n * (n - 1)
                    result += cnt * (cnt - 1);
                }
            }
        }
        return result;
    }

    public static void main(String[] args) {
        NumberOfBoomerangs numberOfBoomerangs = new NumberOfBoomerangs() ;
        numberOfBoomerangs.numberOfBoomerangs(new int[][]{
                {0,0}, {0,1}, {0,2}
        });
    }

}
