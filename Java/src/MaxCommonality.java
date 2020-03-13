import java.nio.IntBuffer;
import java.util.ArrayList;
import java.util.HashMap;

public class MaxCommonality {

    public static int maxLCS(String s) {
        if (s.length() <= 1) {
            return s.length();
        }
        ArrayList<HashMap<Character, Integer>> arrayList = new ArrayList<>();
        for (int i = 1; i < s.length(); i++) {
            Character c = s.charAt(i - 1);
            if (i == 1) {
                HashMap<Character, Integer> map = new HashMap<>();
                map.put(c, 1);
                arrayList.add(map);
            } else {
                HashMap<Character, Integer> map = new HashMap<>(arrayList.get(i - 2));
                if (map.containsKey(c)) {
                    map.put(c, map.get(c) + 1);
                } else {
                    map.put(c, 1);
                }
                arrayList.add(map);
            }
        }
        int res = 0;
        int max = 0;
        HashMap<Character, Integer> newMap = new HashMap<>();
        for (int i = s.length(); i >= 2; i--) {
            Character c = s.charAt(i - 1);
            if (newMap.containsKey(c)) {
                newMap.put(c, newMap.get(c) + 1);
            } else {
                newMap.put(c, 1);
            }
            HashMap<Character, Integer> map = arrayList.get(i - 2);
            System.out.println(c);
            System.out.println(map);
            if (map.containsKey(c)) {
                System.out.println(newMap.get(c));
                System.out.println(map.get(c));
                if (newMap.get(c) <= map.get(c)) {
                    max = Math.max(++res, max);
                }
            }
        }
        return Math.min(max, s.length() / 2);
    }

    public static void main(String[] args) {
        System.out.println(MaxCommonality.maxLCS("acdccc"));
    }

}
