/**
 * Created by Kray on 2017/1/11.
 */
public class Climbing_Stairs {

    public static void main(String[] args) {
        Climbing_Stairs climbing_stairs = new Climbing_Stairs();
        System.out.println(climbing_stairs.climbStairs(10));
    }

    public int climbStairs(int n) {
        if (n == 1 || n == 2) {
            return n;
        } else {
            int f1 = 1;
            int f2 = 1;
            for (int i = 1; i < n; i++) {
                f2 = f1 + f2;
                f1 = f2 - f1;
            }
            return f2;
        }
    }
}
