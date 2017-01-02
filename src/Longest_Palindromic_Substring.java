/**
 * Created by Kray on 2016/12/24.
 */
public class Longest_Palindromic_Substring {

    private int location;
    private int length;

    public static void main(String[] args) {
        Longest_Palindromic_Substring longest_palindromic_substring = new Longest_Palindromic_Substring();
        System.out.println(longest_palindromic_substring.longestPalindrome("lcnvoknqgejxbfhijmxglisfzjwbtvhodwummdqeggzfczmetrdnoetmcydwddmtubcqmdjwnpzdqcdhplxtezctvgnpobnnscrmeqkwgiedhzsvskrxwfyklynkplbgefjbyhlgmkkfpwngdkvwmbdskvagkcfsidrdgwgmnqjtdbtltzwxaokrvbxqqqhljszmefsyewwggylpugmdmemvcnlugipqdjnriythsanfdxpvbatsnatmlusspqizgknabhnqayeuzflkuysqyhfxojhfponsndytvjpbzlbfzjhmwoxcbwvhnvnzwmkhjxvuszgtqhctbqsxnasnhrusodeqmzrlcsrafghbqjpyklaaqximcjmpsxpzbyxqvpexytrhwhmrkuybtvqhwxdqhsnbecpfiudaqpzsvfaywvkhargputojdxonvlprzwvrjlmvqmrlftzbytqdusgeupuofhgonqoyffhmartpcbgybshllnjaapaixdbbljvjomdrrgfeqhwffcknmcqbhvulwiwmsxntropqzefwboozphjectnudtvzzlcmeruszqxvjgikcpfclnrayokxsqxpicfkvaerljmxchwcmxhtbwitsexfqowsflgzzeynuzhtzdaixhjtnielbablmckqzcccalpuyahwowqpcskjencokprybrpmpdnswslpunohafvminfolekdleusuaeiatdqsoatputmymqvxjqpikumgmxaxidlrlfmrhpkzmnxjtvdnopcgsiedvtfkltvplfcfflmwyqffktsmpezbxlnjegdlrcubwqvhxdammpkwkycrqtegepyxtohspeasrdtinjhbesilsvffnzznltsspjwuogdyzvanalohmzrywdwqqcukjceothydlgtocukc"));
    }

    public String longestPalindrome2(String s) {
        for (int i = s.length() - 1; i >= 0; i--) {
            for (int j = 0; j < s.length() - i; j++) {
                String subStr = s.substring(j, j + i + 1);
                if (isPalindrome(subStr)) {
                    return subStr;
                }
            }
        }
        return "";
    }

    private boolean isPalindrome(String s) {
        for (int i = 0; i < s.length() / 2; i++) {
            if (s.charAt(i) != s.charAt(s.length() - 1 - i)) {
                return false;
            }
        }
        return true;
    }

    /**********/

    public String longestPalindrome(String s) {
        if (s.length() < 2) {
            return s;
        }
        for (int i = 0; i < s.length() - 1; i++) {
            extendStrToPalindrome(s, i, i);
            extendStrToPalindrome(s, i, i + 1);
        }
        return s.substring(location + 1, location + length);
    }

    private void extendStrToPalindrome(String s, int beginIndex, int endIndex) {
        while (beginIndex >= 0 && endIndex < s.length() && (s.charAt(beginIndex) == s.charAt(endIndex))) {
            beginIndex--;
            endIndex++;
        }
        if (length < endIndex - beginIndex) {
            location = beginIndex;
            length = endIndex - beginIndex;
        }
    }
}
