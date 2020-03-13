/**
 * Created by Kray on 2016/12/27.
 */
public class Kth_Largest_Element_in_an_Array {

    public static void main(String[] args) {
        Kth_Largest_Element_in_an_Array kth_largest_element_in_an_array = new Kth_Largest_Element_in_an_Array();
        System.out.println(kth_largest_element_in_an_array.findKthLargest(new int[]{1, 4, 2, 5, 3, 6}, 1));
    }

    public int findKthLargest(int[] nums, int k) {
        for (int i = nums.length - 1; i > 0; --i) {
            for (int j = 0; j < i; ++j) {
                if (nums[j + 1] < nums[j]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                }
            }
        }
        return nums[nums.length - k];
    }

}


