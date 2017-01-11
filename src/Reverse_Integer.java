/**
 * Created by Kray on 2017/1/11.
 */
public class Reverse_Integer {

    public static void main(String[] args) {
        Reverse_Integer reverse_integer = new Reverse_Integer();
        System.out.println(reverse_integer.reverse(1222222222));
    }

    public int reverse(int x) {
        boolean isNeg = x < 0;
        x = x > 0 ? x : -x;
        int result = 0;
        int newResult = 0;
        while (x > 0) {
            newResult = result * 10 + x % 10;
            if ((newResult - x % 10) / 10 != result) {
                return 0;
            }
            result = newResult;
            x /= 10;
        }
        return result * (isNeg ? -1 : 1);
    }
}
