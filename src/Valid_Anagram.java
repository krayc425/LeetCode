/**
 * Created by Kray on 2016/12/25.
 */
public class Valid_Anagram {
    public static void main(String[] args) {
        Valid_Anagram valid_anagram = new Valid_Anagram();
        System.out.println(valid_anagram.isAnagram("aoivnwd", "dwnvaio"));
    }
    public boolean isAnagram(String s, String t) {
        if(s.length() != t.length()){
            return false;
        }
        int letters[] = new int[26];
        for (int i = 0; i < s.length(); i++) {
            letters[s.charAt(i) - 97]++;
            letters[t.charAt(i) - 97]--;
        }
        for (int i = 0; i < 26; i++) {
            if(letters[i] != 0){
                return false;
            }
        }
        return true;
    }
}
