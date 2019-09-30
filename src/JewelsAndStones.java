import java.util.HashSet;

public class JewelsAndStones {

    public int numJewelsInStones(String J, String S) {
        HashSet<Character> set = new HashSet<>();
        for (Character c : J.toCharArray()) {
            set.add(c);
        }
        int res = 0;
        for (Character c : S.toCharArray()) {
            if (set.contains(c)) {
                res++;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        System.out.println(new JewelsAndStones().numJewelsInStones("Aa", "aAAbbbb"));
    }

}
