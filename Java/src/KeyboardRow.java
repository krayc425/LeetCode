import java.util.ArrayList;
import java.util.List;

public class KeyboardRow {
    public String[] findWords(String[] words) {
        List<String> result = new ArrayList<>();
        for (String word : words) {
            if (word.length() == 0) {
                continue;
            } else {
                if (isValid(word)) {
                    result.add(word);
                }
            }
        }
        return result.toArray(new String[result.size()]);
    }

    private final String[] lines = {
            "qwertyuiop",
            "asdfghjkl",
            "zxcvbnm"
    };

    private boolean isValid(String word) {
        if (word.length() == 0) {
            return false;
        } else {
            word = word.toLowerCase();
            char c = word.charAt(0);
            String l = "";
            for (String line : lines) {
                if (line.indexOf(c) != -1) {
                    l = line;
                    break;
                }
            }
            for (int i = 1; i < word.length(); i++) {
                if (l.indexOf(word.charAt(i)) == -1) {
                    return false;
                }
            }
        }
        return true;
    }
}
