/**
 * Created by Kray on 2017/1/4.
 */
public class Longest_Common_Prefix {

    public static void main(String[] args) {
        Longest_Common_Prefix longest_common_prefix = new Longest_Common_Prefix();
        System.out.println(longest_common_prefix.longestCommonPrefix(new String[]{"aa", "a"}));
    }

    public String longestCommonPrefix(String[] strs) {
        String result = "";
        if (strs.length == 0) {
            return result;
        }
        if (strs.length == 1) {
            return strs[0];
        }
        int i = 0;
        while (true) {
            if (i > strs[0].length() - 1) {
                break;
            }
            char c = strs[0].charAt(i);
            boolean flag = false;
            for (int j = 1; j < strs.length; j++) {
                if (strs[j].length() - 1 < i || strs[j].charAt(i) != c) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                break;
            } else {
                i += 1;
                result += c;
            }
        }
        return result;
    }
}
