/**
 * Created by Kray on 2017/3/18.
 */
public class First_Unique_Character_in_a_String {

    public static void main(String[] args) {
        First_Unique_Character_in_a_String first_unique_character_in_a_string = new First_Unique_Character_in_a_String();
        System.out.println(first_unique_character_in_a_string.firstUniqChar("lleetcode"));
    }

    public int firstUniqChar(String s) {
        int[] isUniq = new int[26];
        for (int i = 0; i < s.length(); i++) {
            isUniq[s.charAt(i) - 'a']++;
        }
        for (int i = 0; i < s.length(); i++) {
            if (isUniq[s.charAt(i) - 'a'] == 1) {
                return i;
            }
        }
        return -1;
    }

}
