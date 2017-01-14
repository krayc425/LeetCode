import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kray on 2017/1/14.
 */
public class Pascals_Triangle {

    public static void main(String[] args) {
        Pascals_Triangle p = new Pascals_Triangle();
        p.generate(5);
    }

    public List<List<Integer>> generate(int numRows) {
        List<List<Integer>> result = new ArrayList<>();
        for (int i = 0; i < numRows; i++) {
            if (i == 0) {
                ArrayList<Integer> integers = new ArrayList<>();
                integers.add(1);
                result.add(integers);
            } else {
                ArrayList<Integer> integers = new ArrayList<>();
                ArrayList<Integer> prevInts = (ArrayList<Integer>) result.get(i - 1);
                for (int j = 0; j < prevInts.size(); j++) {
                    if (j == 0) {
                        integers.add(1);
                    } else {
                        integers.add(prevInts.get(j - 1) + prevInts.get(j));
                    }
                }
                integers.add(1);
                result.add(integers);
            }
        }
        return result;
    }
}
