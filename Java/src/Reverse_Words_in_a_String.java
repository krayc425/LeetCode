import java.util.ArrayList;

/**
 * Created by Kray on 2016/12/27.
 */
public class Reverse_Words_in_a_String {

    public static void main(String[] args) {
        Reverse_Words_in_a_String reverse_words_in_a_string = new Reverse_Words_in_a_String();
        System.out.println(reverse_words_in_a_string.reverseWords(" "));
    }

    public String reverseWords(String s) {
        String[] parts = s.trim().split("\\s+");
        String result = "";
        for (int i = parts.length - 1; i >= 0; i--) {
            result += parts[i] + (i == 0 ? "" : " ");
        }
        return result;
    }
}
