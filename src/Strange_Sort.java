import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Strange_Sort {

    public static List<String> strangeSort(List<Integer> mapping, List<String> nums) {
        ArrayList<String> result = new ArrayList<>();
        ArrayList<String> temp = new ArrayList<>();
        ArrayList<Integer> integers = new ArrayList<>();
        for (int i = 0; i <= 9; i++) {
            integers.add(mapping.indexOf(i));
        }
        for (String s : nums) {
            StringBuilder sb = new StringBuilder();
            for (Character c : s.toCharArray()) {
                if (sb.length() == 0 && integers.get(c - '0') == 0) {
                    continue;
                }
                sb.append(integers.get(c - '0'));
            }
            int k = 0;
            while (k < result.size()) {
                if (Integer.parseInt(sb.toString()) <= Integer.parseInt(temp.get(k))) {
                    k++;
                } else {
                    break;
                }
            }
            temp.add(k - 1 >= 0 ? k - 1 : 0, sb.toString());
            result.add(k - 1 >= 0 ? k - 1 : 0, s);
        }
        return result;
    }

    public static void main(String[] args) {
        ArrayList<Integer> map = new ArrayList<>();
        map.add(3);
        map.add(5);
        map.add(4);
        map.add(6);
        map.add(2);
        map.add(7);
        map.add(9);
        map.add(8);
        map.add(0);
        map.add(1);
        ArrayList<String> nums = new ArrayList<>();
        nums.add("990");
        nums.add("332");
        nums.add("32");
        Strange_Sort.strangeSort(map, nums);
    }

}
