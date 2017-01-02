import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kray on 2016/12/23.
 */
public class Summary_Ranges {

    public static void main(String[] args) {
        Summary_Ranges summary_ranges = new Summary_Ranges();
        System.out.println(summary_ranges.summaryRanges(new int[]{1, 3}));
    }

    public List<String> summaryRanges(int[] nums) {
        List<String> resultList = new ArrayList<>();
        int i = 0;
        while (i < nums.length) {
            int start = nums[i];
            int end;

            while (true) {
                if (i == nums.length - 1 || nums[i + 1] != nums[i] + 1) {
                    break;
                } else {
                    i++;
                }
            }

            end = nums[i];

            if (start != end) {
                resultList.add(start + "->" + end);
            } else {
                resultList.add(start + "");
            }

            i++;
        }
        return resultList;
    }
}
