import java.util.HashMap;

public class Isomorphic_Strings {

    public boolean isIsomorphic(String s, String t) {
        HashMap<Integer, Integer> mapS = new HashMap<>();
        HashMap<Integer, Integer> mapT = new HashMap<>();
        for (int i = 0; i < s.length(); i++) {
            if (mapS.get(s.charAt(i) - '0') == null) {
                mapS.put(s.charAt(i) - '0', t.charAt(i) - '0');
            } else if (mapS.get(s.charAt(i) - '0') != t.charAt(i) - '0') {
                return false;
            }
            if (mapT.get(t.charAt(i) - '0') == null) {
                mapT.put(t.charAt(i) - '0', s.charAt(i) - '0');
            } else if (mapT.get(t.charAt(i) - '0') != s.charAt(i) - '0') {
                return false;
            }

        }
        return true;
    }


    public static void main(String[] args) {
        System.out.println(new Isomorphic_Strings().isIsomorphic("abra3", "ejeef"));
    }


}
