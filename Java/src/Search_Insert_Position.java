/**
 * Created by Kray on 2017/3/17.
 */
public class Search_Insert_Position {

    public static void main(String[] args) {
        Search_Insert_Position search_insert_position = new Search_Insert_Position();
        System.out.println(search_insert_position.searchInsert(new int[]{1, 3, 5, 6}, 2));
    }

    public int searchInsert(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target) {
                return i;
            } else if (nums[i] > target) {
                return i;
            }
        }
        return nums.length;
    }
}
