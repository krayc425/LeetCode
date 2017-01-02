/**
 * Created by Kray on 2016/12/30.
 */
public class Factorial_Trailing_Zeroes {

    public static void main(String[] args) {
        Factorial_Trailing_Zeroes factorial_trailing_zeroes = new Factorial_Trailing_Zeroes();
        System.out.println(factorial_trailing_zeroes.trailingZeroes(30));
    }

    public int trailingZeroes(int n) {
//  Base on the idea that:
//  numOfTrailingZeros = n / 5 + n / 25 + n / 125 + n / 625 + n / 3125 + ...
        return n == 0 ? 0 : n / 5 + trailingZeroes(n / 5);
    }

}
