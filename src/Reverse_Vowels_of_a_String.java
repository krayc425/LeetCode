import java.util.*;

import static java.util.Arrays.asList;

public class Reverse_Vowels_of_a_String {
    public String reverseVowels(String s) {
        if (s == null || s.length() == 0) {
            return s;
        }
        String vowels = "aeiouAEIOU";
        char[] chars = s.toCharArray();
        int start = 0;
        int end = s.length() - 1;
        while (start < end) {
            while (start < end && !vowels.contains(chars[start] + "")) {
                start++;
            }
            while (start < end && !vowels.contains(chars[end] + "")) {
                end--;
            }
            // swap
            char temp = chars[start];
            chars[start] = chars[end];
            chars[end] = temp;

            start++;
            end--;
        }
        return new String(chars);
    }

    public static void main(String[] args) {
        Reverse_Vowels_of_a_String reverse_vowels_of_a_string = new Reverse_Vowels_of_a_String();
        reverse_vowels_of_a_string.reverseVowels("hallelitcodu");
    }
}
