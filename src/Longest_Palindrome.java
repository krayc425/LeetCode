/**
 * Created by Kray on 2017/1/2.
 */
public class Longest_Palindrome {

    public static void main(String[] args) {
        Longest_Palindrome longest_palindrome = new Longest_Palindrome();
        System.out.println(longest_palindrome.longestPalindrome("ccc"));
    }

    public int longestPalindrome(String s) {
        int arr[] = new int[52];
        int result = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 'a' && c <= 'z') {
                arr[c - 'a']++;
            } else {
                arr[c - 'A' + 26]++;
            }
        }
        boolean hasMid = false;
        for (int i : arr) {
            result += (i - (i % 2));
            if (!hasMid && i % 2 == 1) {
                hasMid = true;
            }
        }
        return result + (hasMid ? 1 : 0);
    }
}
