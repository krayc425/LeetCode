import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Gray_Code {
    public List<Integer> grayCode(int n) {
        List<Integer> result = new ArrayList<>(Arrays.asList(0));
        for (int i = 1; i < (1 << n); i <<= 1) {
            for (int j = result.size() - 1; j >= 0; j--) {
                result.add(result.get(j) | i);
            }
        }
        return result;
    }
}
