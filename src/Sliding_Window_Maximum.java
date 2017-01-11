/**
 * Created by Kray on 2017/1/11.
 */
public class Sliding_Window_Maximum {

    public static void main(String[] args) {
        Sliding_Window_Maximum sliding_window_maximum = new Sliding_Window_Maximum();
        int n[] = sliding_window_maximum.maxSlidingWindow(new int[]{1, 3, -1, -3, 5, 3, 6, 7}, 3);
        for (int i = 0; i < n.length; i++) {
            System.out.print(n[i] + (i == n.length - 1 ? "" : ", "));
        }
    }

    public int[] maxSlidingWindow(int[] nums, int k) {
        if (nums.length == 0 || k == 0) {
            return new int[]{};
        }
        int result[] = new int[nums.length - k + 1];
        for (int i = 0; i < result.length; i++) {
            int max = nums[i];
            for (int j = i; j < k + i; j++) {
                if (nums[j] >= max) {
                    max = nums[j];
                }
            }
            result[i] = max;
        }
        return result;
    }
}
