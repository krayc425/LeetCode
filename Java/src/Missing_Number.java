/**
 * Created by Kray on 2016/12/28.
 */
public class Missing_Number {

    public static void main(String[] args) {
        Missing_Number missing_number = new Missing_Number();
        System.out.println(missing_number.missingNumber(new int[]{0,3,1,4,2,5,6,7,10,9}));
    }

    public int missingNumber(int[] nums) {
        int numbers[] = new int[nums.length + 1];
        for (int i = 0; i < numbers.length; i++) {
            numbers[i] = i;
        }
        for (int i = 0; i < nums.length; i++) {
            numbers[nums[i]] = 0;
        }
        for (int i = 0; i < numbers.length; i++) {
            if(numbers[i] != 0){
                return numbers[i];
            }
        }
        return 0;
    }
}
