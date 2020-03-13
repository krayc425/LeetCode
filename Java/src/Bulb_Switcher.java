/**
 * Created by Kray on 2016/12/24.
 */
public class Bulb_Switcher {

    public static void main(String[] args) {
        Bulb_Switcher bulb_switcher = new Bulb_Switcher();
        System.out.println(bulb_switcher.bulbSwitch(99999999));
    }

    public int bulbSwitch(int n) {
        boolean[] bulbs = new boolean[n];
        int totalNum = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= (n / i); j++) {
                bulbs[i * j - 1] = !bulbs[i * j - 1];
            }
        }
        for (int i = 0; i < n; i++) {
            if (bulbs[i]) {
                totalNum++;
            }
        }
        return totalNum;
    }

}
