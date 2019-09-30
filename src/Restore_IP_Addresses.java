import java.util.ArrayList;
import java.util.List;

public class Restore_IP_Addresses {
    public List<String> restoreIpAddresses(String s) {
        if (s.length() < 4 || s.length() > 12) {
            return new ArrayList<>();
        }
        List<String> result = new ArrayList<>();
        process(result, 0, 0, s, new StringBuilder());
        return result;
    }

    private void process(List<String> list, int count, int startIndex, String s, StringBuilder sb) {
        if (count == 4) {
            if (startIndex == s.length()) {
                list.add(sb.toString());
            }
            return;
        }
        for (int i = 1; i <= Math.min(s.length() - startIndex, 3); i++) {
            int num = Integer.parseInt(s.substring(startIndex, startIndex + i));
            if (num >= 0 && num <= 255) {
                if (num < 10 && i > 1) {
                    return;
                }
                StringBuilder newSb = new StringBuilder(sb);
                if (count == 0) {
                    newSb.append(num);
                } else {
                    newSb.append(".").append(num);
                }
                process(list, count + 1, startIndex + i, s, newSb);
            } else {
                return;
            }
        }
    }

    public static void main(String[] args) {
        Restore_IP_Addresses r = new Restore_IP_Addresses();
        r.restoreIpAddresses("1111111111");
    }
}
