public class Single_Number_2 {
    public int singleNumber(int[] nums) {
        int[] digits = new int[32];
        for (int i = 0; i < 32; i++) {
            for (int num : nums) {
                digits[i] += (num >> i) & 1;
            }
        }
        int res = 0;
        for (int i = 0; i < 32; i++) {
            res += (digits[i] % 3) << i;
        }
        return res;
    }

    public static void main(String[] args) {
        Single_Number_2 single_number_2 = new Single_Number_2();
        System.out.println(single_number_2.singleNumber(new int[]{-1, -2, -3, -1, -2, -3, -1, -2, -3, 5}));
    }
}
