import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kray on 2017/1/14.
 */
public class Find_All_Numbers_Disappeared_in_an_Array {

    public static void main(String[] args) {
        Find_All_Numbers_Disappeared_in_an_Array f = new Find_All_Numbers_Disappeared_in_an_Array();
        ArrayList<Integer> integers = (ArrayList<Integer>) f.findDisappearedNumbers(new int[]{4,3,2,7,8,2,3,1});

        for (int i = 0; i < integers.size(); i++) {
            System.out.print(integers.get(i) + ", ");
        }

    }

    public List<Integer> findDisappearedNumbers(int[] nums) {
        ArrayList<Integer> result = new ArrayList<>();
        for (int i = 0; i < nums.length; i++) {
            int j = Math.abs(nums[i]) - 1;
            if(nums[j] > 0){
                nums[j] = -nums[j];
            }
        }
        for (int i = 0; i < nums.length; i++) {
            if(nums[i] > 0){
                result.add(i+1);
            }
        }
        return result;
    }
}
