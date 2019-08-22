import java.util.LinkedList;
import java.util.List;

public class BullsAndCows {
    public String getHint(String secret, String guess) {
        int len = secret.length();
        int bullCnt = 0;
        int cowCnt = 0;
        int[] cowArr = new int[10];
        List<Integer> usedIdx = new LinkedList<>();
        for (int i = 0; i < len; i++) {
            if (secret.charAt(i) == guess.charAt(i)) {
                bullCnt++;
                usedIdx.add(i);
            } else {
                cowArr[secret.charAt(i) - '0']++;
            }
        }
        for (int i = 0; i < len; i++) {
            if (!usedIdx.contains(i)) {
                int num = guess.charAt(i) - '0';
                if (cowArr[num] > 0) {
                    cowCnt++;
                    cowArr[num]--;
                }
            }
        }
        return bullCnt + "A" + cowCnt + "B";
    }

    public static void main(String[] args) {
        System.out.println(new BullsAndCows().getHint("11", "10"));
    }
}
