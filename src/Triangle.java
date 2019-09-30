import java.util.List;

public class Triangle {
    public int minimumTotal(List<List<Integer>> triangle) {
        for (int i = triangle.size() - 1; i > 0; i--) {
            List<Integer> current = triangle.get(i);
            List<Integer> prev = triangle.get(i - 1);
            for (int j = 0; j < prev.size(); j++) {
                int t = prev.remove(j);
                prev.add(j, t + Math.min(current.get(i), current.get(i + 1)));
            }
        }
        return triangle.get(0).get(0);
    }
}
