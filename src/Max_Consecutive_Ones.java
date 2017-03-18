/**
 * Created by Kray on 2017/3/16.
 */
public class Max_Consecutive_Ones {

    public static void main(String[] args) {
        Max_Consecutive_Ones max_consecutive_ones = new Max_Consecutive_Ones();
        System.out.println(max_consecutive_ones.findMaxConsecutiveOnes(new int[]{1}));
    }

    public int findMaxConsecutiveOnes(int[] nums) {
        if (nums == null) {
            return 0;
        }
        int max = 0;
        int tempMax = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 1) {
                tempMax++;
            } else {
                tempMax = 0;
            }
            if (tempMax >= max) {
                max = tempMax;
            }
        }
        return max;
    }
}
