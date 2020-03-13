/**
 * Created by Kray on 2016/12/27.
 */
public class Ransom_Note {

    public static void main(String[] args) {
        Ransom_Note ransom_note = new Ransom_Note();
        System.out.println(ransom_note.canConstruct("asuvn", "avunnoew"));
    }

    public boolean canConstruct(String ransomNote, String magazine) {
        if (ransomNote.length() > magazine.length()) {
            return false;
        }
        int[] letters = new int[26];
        for (int i = 0; i < ransomNote.length(); i++) {
            letters[ransomNote.charAt(i) - 'a']++;
        }
        for (int i = 0; i < magazine.length(); i++) {
            letters[magazine.charAt(i) - 'a']--;
        }
        for (int i : letters) {
            if (i > 0) {
                return false;
            }
        }
        return true;
    }

}
