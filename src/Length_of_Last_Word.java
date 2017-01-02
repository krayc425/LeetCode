/**
 * Created by Kray on 2016/12/26.
 */
public class Length_of_Last_Word {

    public static void main(String[] args) {
        Length_of_Last_Word length_of_last_word = new Length_of_Last_Word();
        System.out.println(length_of_last_word.lengthOfLastWord("a   b   "));
    }

    public int lengthOfLastWord(String s) {
        if (s.length() == 0) {
            return 0;
        }
        int index = s.length() - 1;
        int count = 0;
        boolean started = false;
        do {
            if (s.charAt(index) == ' ') {
                if (started) {
                    return count;
                }
            } else {
                started = true;
                count++;
            }
            index--;
        } while (index >= 0);
        return count;
    }
}
