/**
 * Created by Kray on 2017/1/2.
 */
public class Power_of_Two {

    public static void main(String[] args) {
        Power_of_Two power_of_two = new Power_of_Two();
        System.out.println(power_of_two.isPowerOfTwo(0));
    }

    public boolean isPowerOfTwo(int n) {
        return n >= 1 && (n == 1 || n % 2 != 1 && isPowerOfTwo(n / 2));
    }
}
