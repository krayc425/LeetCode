/**
 * Created by Kray on 2017/1/4.
 */
public class Longest_Common_Prefix {

    public static void main(String[] args) {
        Longest_Common_Prefix longest_common_prefix = new Longest_Common_Prefix();
        System.out.println(longest_common_prefix.longestCommonPrefix(new String[]{"a", "abciurf", "abcoij2h3", "abcouih4"}));
    }

    public String longestCommonPrefix(String[] strs) {
        String result = "";
        if(strs.length == 0){
            return result;
        }
        int i = 0;
        while (true) {
            boolean flag = false;
            if(strs[0].length() == 0){
                return "";
            }
            char c = strs[0].charAt(i);
            for (int j = 1; j < strs.length; j++) {
                if ((strs[j].charAt(i) - c) != 0) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                break;
            } else {
                result += c;
                i++;
            }
        }
        return result;
    }
}
