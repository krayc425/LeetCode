import java.util.ArrayList;

/**
 * Created by Kray on 2016/12/28.
 */
public class Happy_Number {

    public static void main(String[] args) {
        Happy_Number happy_number = new Happy_Number();
        System.out.println(happy_number.isHappy(20));
    }

    public boolean isHappy(int n) {
        ArrayList<Integer> integers = new ArrayList<>();
        int temp = n;
        while (temp != 1) {
            temp = sumOfSquare(temp);
            if (integers.contains(temp)) {
                return false;
            } else {
                integers.add(temp);
            }
        }
        return true;
    }

    private int sumOfSquare(int n) {
        int result = 0;
        while (n > 0) {
            result += ((n % 10) * (n % 10));
            n /= 10;
        }
        return result;
    }
}
