import java.util.*;

public class Decode_Ways {

    private Set<String> result = new HashSet<>();

    public int numDecodings(String s) {
        if (s.length() == 0) {
            return 0;
        }
//        process(s, 1, "");
//        process(s, 2, "");
//        return result.size();
        // 本质就是一个斐波那契数列
        int[] res = new int[s.length()];
        res[0] = s.charAt(0) == '0' ? 0 : 1;
        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) != '0') {
                res[i] += res[i - 1];
            }
            int num = Integer.parseInt(s.substring(i - 1, i + 1));
            if (s.charAt(i - 1) != '0' && num <= 26) {
                res[i] += i > 1 ? res[i - 2] : 1;
            }
            for (int j = 0; j < res.length; j++) {
                System.out.print(res[j]);
                System.out.print(", ");
            }
            System.out.println();
        }
        return res[s.length() - 1];
    }

    private void process(String s, Integer isOne, String res) {
        System.out.println(result);
        if (s.length() == 0) {
            result.add(res);
            return;
        }
        System.out.println(s);
        if (isOne == 1) {
            int isOk = s.charAt(0) - '0';
            if (isOk >= 1 && isOk <= 9) {
                res += '-';
                res += s.charAt(0);
                process(s.substring(1), 1, res);
                process(s.substring(1), 2, res);
            }
        } else if (isOne == 2) {
            if (s.length() < 2) {
                return;
            }
            int num = Integer.parseInt(s.substring(0, 2));
            if (num >= 10 && num <= 26) {
                res += '-';
                res += s.substring(0, 2);
                process(s.substring(2), 1, res);
                process(s.substring(2), 2, res);
            }
        }
    }

    public static void main(String[] args) {
        Decode_Ways decode_ways = new Decode_Ways();
        System.out.println(decode_ways.numDecodings("10"));
    }
}
