import java.util.LinkedList;
import java.util.List;

public class LetterCombinationsOfPhoneNumber {

    public List<String> letterCombinations(String digits) {
        String[] dict = new String[]{"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
        List<String> result = new LinkedList<>();
        for (char digit : digits.toCharArray()) {
            int idx = digit - '0';
            if (idx < 2 || idx > 9) {
                continue;
            }
            if (result.isEmpty()) {
                for (char c : dict[idx].toCharArray()) {
                    result.add(c + "");
                }
            } else {
                List<String> temp = new LinkedList<>();
                List<String> remove = new LinkedList<>(result);
                for (String s : result) {
                    for (char c : dict[idx].toCharArray()) {
                        temp.add(s + c);
                    }
                }
                result.removeAll(remove);
                result.addAll(temp);
            }
        }
        return result;
    }

    public static void main(String[] args) {
        LetterCombinationsOfPhoneNumber l = new LetterCombinationsOfPhoneNumber();
        System.out.println(l.letterCombinations("12398"));
    }

}