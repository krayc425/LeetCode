/**
 * Created by Kray on 2016/12/29.
 */
public class Move_Zeroes {

    public static void main(String[] args) {
        Move_Zeroes move_zeroes = new Move_Zeroes();
        move_zeroes.moveZeroes(new int[]{1, 6, 3, 2, 2, 7, 4, 2, 0, 0, 4, 2, 2, 0, 5, 3, 0, 6, 5, 0});
    }

    public void moveZeroes(int[] nums) {
        int j = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != 0) {
                nums[j++] = nums[i];
            }
        }
        while (j < nums.length) {
            nums[j] = 0;
            j++;
        }
    }
}
