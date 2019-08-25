import java.util.HashSet;
import java.util.Set;

public class LongestSubstringWithoutRepeatingCharacters {
    public int lengthOfLongestSubstring(String s) {
        int l = s.length();
        if (l <= 1) {
            return l;
        }
        Set<Character> charSet = new HashSet<>();
        int i = 0;
        int max = 0;
        while (i < l) {
            int j = i + charSet.size();
            while (j < l && !charSet.contains(s.charAt(j))) {
                charSet.add(s.charAt(j));
                j++;
            }
            int newL = j - i;
            if (newL > max) {
                max = newL;
            }
            charSet.remove(s.charAt(i));
            i++;
        }
        return max;
    }

    public static void main(String[] args) {
        LongestSubstringWithoutRepeatingCharacters l = new LongestSubstringWithoutRepeatingCharacters();
        System.out.println(l.lengthOfLongestSubstring("dvdf"));
    }
}
