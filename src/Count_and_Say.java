/**
 * Created by Kray on 2016/12/26.
 */
public class Count_and_Say {

    public static void main(String[] args) {
        Count_and_Say count_and_say = new Count_and_Say();
        System.out.println(count_and_say.countAndSay(5));
    }

    public String countAndSay(int n) {
        String i = "1";
        while (n > 1) {
            i = generateNext(i);
            n--;
        }
        return i;
    }

    private String generateNext(String num) {
        String result = "";
        int currentNum = num.charAt(0) - 48;
        int count = 1;
        if (num.length() == 1) {
            return count + "" + currentNum;
        }
        for (int i = 1; i < num.length(); i++) {
            if (num.charAt(i) - 48 == currentNum) {
                count++;
            } else {
                result = result + count + "" + currentNum;
                count = 1;
                currentNum = num.charAt(i) - 48;
            }
            if (i == num.length() - 1) {
                result = result + count + "" + currentNum;
            }
        }
        return result;
    }
}
