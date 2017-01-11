/**
 * Created by Kray on 2017/1/11.
 */
public class Arranging_Coins {

    public static void main(String[] args) {
        Arranging_Coins arranging_coins = new Arranging_Coins();
        System.out.println(arranging_coins.arrangeCoins(1));
    }

    public int arrangeCoins(int n) {
        int i = 1;
        while ((n -= i) >= 0) {
            i++;
        }
        return i - 1;
    }
}
