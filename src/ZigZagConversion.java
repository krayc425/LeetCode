public class ZigZagConversion {
    public String convert(String s, int numRows) {
        if (s.length() == 0 || s.length() <= numRows || numRows == 1) {
            return s;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(s);
        int groupUnitSize = 2 * numRows - 2;
        if (s.length() % groupUnitSize != 0) {
            for (int i = 0; i < groupUnitSize - s.length() % groupUnitSize; i++) {
                sb.append(" ");
            }
        }
        String newString = sb.toString();
        int groupSize = newString.length() / groupUnitSize;
        String[] group = new String[groupSize];
        for (int i = 0; i <= newString.length() - groupUnitSize; i += groupUnitSize) {
            group[i / groupUnitSize] = newString.substring(i, i + groupUnitSize);
        }
        StringBuilder res = new StringBuilder();
        for (String groupString : group) {
            res.append(groupString.charAt(0));
        }
        int start = 1;
        int end = groupUnitSize - 1;
        while (start <= end) {
            for (String groupString : group) {
                char startChar = groupString.charAt(start);
                if (startChar != ' ') {
                    res.append(startChar);
                }
                char endChar = groupString.charAt(end);
                if (start != end && endChar != ' ') {
                    res.append(endChar);
                }
            }
            start++;
            end--;
        }
        return res.toString();
    }

    public static void main(String[] args) {
        ZigZagConversion z = new ZigZagConversion();
        System.out.println(z.convert("ABCD", 2));
    }
}
