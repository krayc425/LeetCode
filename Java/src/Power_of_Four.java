/**
 * Created by Kray on 2017/1/4.
 */
public class Power_of_Four {

    public static void main(String[] args) {
        Power_of_Four four = new Power_of_Four();
        System.out.println(four.isPowerOfFour(16));
    }

    public boolean isPowerOfFour(int num) {
        if (num == 0) {
            return false;
        }
        int count = 0;
        while ((num & 1) != 1) {
            num >>= 1;
            count++;
        }
        return num == 1 && count % 2 == 0;
    }
}
