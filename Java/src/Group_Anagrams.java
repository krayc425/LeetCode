import java.util.*;

public class Group_Anagrams {
    public List<List<String>> groupAnagrams(String[] strs) {
        // Key: 排序过的单词
        // Value: 排序过的单词所关联的anagrams
        Map<String, List<String>> result = new HashMap<>();
        for (String s : strs) {
            String key = sortString(s);
            if (!result.containsKey(key)) {
                ArrayList<String> temp = new ArrayList<>();
                temp.add(s);
                result.put(key, temp);
            } else {
                List<String> temp = result.get(key);
                temp.add(s);
            }
        }
        return new ArrayList<>(result.values());
    }

    private String sortString(String s) {
        char[] sArr = s.toCharArray();
        Arrays.sort(sArr);
        return String.valueOf(sArr);
    }

    public static void main(String[] args) {
        String[] strs = new String[]{"eat", "tea", "tan", "ate", "nat", "bat"};
        Group_Anagrams group_anagrams = new Group_Anagrams();
        System.out.println(group_anagrams.groupAnagrams(strs));
    }
}