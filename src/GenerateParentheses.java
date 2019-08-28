import java.util.*;

public class GenerateParentheses {
    public List<String> generateParenthesis(int n) {
        if (n == 0) {
            return Collections.singletonList("");
        } else if (n == 1) {
            return Collections.singletonList("()");
        } else {
            List<String> result = new LinkedList<>();
            for (int i = 0; i < n; i++) {
                for (String s1 : generateParenthesis(i)) {
                    for (String s2 : generateParenthesis(n - 1 - i)) {
                        result.add("(" + s2 + ")" + s1);
                    }
                }
            }
            return result;
        }
    }

    public static void main(String[] args) {
        GenerateParentheses g = new GenerateParentheses();
        System.out.println(g.generateParenthesis(4));
    }
}
