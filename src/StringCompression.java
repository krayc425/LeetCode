public class StringCompression {
    public int compress(char[] chars) {
        if (chars.length <= 1) {
            return chars.length;
        }
        int read = 0;
        int write = 0;
        char ch = '\0';
        while (read < chars.length - 1) {
            int count = 1;
            ch = chars[read];
            while (read + 1 != chars.length && chars[++read] == ch) {
                count++;
            }
            if (count > 1) {
                String str = count + "";
                chars[write++] = ch;
                for (int i = 0; i < str.length(); i++) {
                    chars[write++] = str.charAt(i);
                }
            } else {
                chars[write++] = ch;
            }
        }
        if (write < chars.length && chars[chars.length - 1] != ch) {
            chars[write++] = chars[chars.length - 1];
        }
        return write;
    }

    public static void main(String[] args) {
        System.out.println(new StringCompression().compress(new char[]{'a','b','c'}));
    }
}
