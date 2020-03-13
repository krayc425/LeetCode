/**
 * Created by Kray on 2016/12/29.
 */
public class Single_Number {

    public static void main(String[] args) {
        Single_Number single_number = new Single_Number();
        System.out.println(single_number.singleNumber(new int[]{7,7,3,3,6,2,2,6,5,5,9,9,1,0,0}));
    }

    public int singleNumber(int[] nums) {
        int result = 0;
        for (int i : nums) {
            result ^= i;
        }
        return result;
    }
}
