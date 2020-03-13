/**
 * Created by Kray on 2017/1/15.
 */
public class Valid_Palindrome {

    public static void main(String[] args) {
        Valid_Palindrome valid_palindrome = new Valid_Palindrome();
        System.out.println(valid_palindrome.isPalindrome("00pp00"));
    }

    public boolean isPalindrome(String s) {
        return s.length() == 0 || validPalindrome(s.toLowerCase().replaceAll("[^a-z0-9]", ""));
    }

    private boolean validPalindrome(String s) {
        if (s.length() == 1 || s.length() == 0) {
            return true;
        } else {
            for (int i = 0; i <= s.length() / 2; i++) {
                if(s.charAt(i) != s.charAt(s.length() - 1 - i)){
                    return false;
                }
            }
            return true;
        }
    }
}
