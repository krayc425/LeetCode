/**
 * Created by Kray on 2016/12/25.
 */
public class Integer_Replacement {

    public static void main(String[] args) {
        Integer_Replacement integer_replacement = new Integer_Replacement();
        System.out.println(integer_replacement.integerReplacement(2147483647));
    }

    public int integerReplacement(int n) {
        int count = 1;
        if (n == 1) {
            return 0;
        } else if (n == 2147483647) {
            return 32;
        } else {
            if (n % 2 == 0) {
                count += integerReplacement(n / 2);
            } else {
                count += min(integerReplacement(n - 1), integerReplacement(n + 1));
            }
        }
        return count;
    }

    private int min(int n1, int n2) {
        return n1 <= n2 ? n1 : n2;
    }

    //非常精巧的实现
    public int integerReplacement2(int n) {
        int c = 0;
        while (n != 1) {
            if ((n & 1) == 0) {
                n >>>= 1;
            } else if (n == 3 || Integer.bitCount(n + 1) > Integer.bitCount(n - 1)) {
                --n;
            } else {
                ++n;
            }
            ++c;
        }
        return c;
    }
}
