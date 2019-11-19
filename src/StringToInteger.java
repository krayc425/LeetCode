public class StringToInteger {
    public int myAtoi(String str) {
        str = str.trim();
        String validFirst = "+-0123456789";
        if (str.length() == 0 || !validFirst.contains(str.charAt(0) + "")) {
            return 0;
        }
        boolean isNeg = str.charAt(0) == '-';
        if (str.charAt(0) == '+' || str.charAt(0) == '-') {
            str = str.substring(1);
        }
        int i = 0;
        int numLength = 0;
        int leadingZero = 0;
        while (i < str.length() && str.charAt(i) >= '0' && str.charAt(i) <= '9') {
            if (leadingZero == 0) {
                while (i < str.length() && str.charAt(i) == '0') {
                    i++;
                    leadingZero++;
                }
                leadingZero = (leadingZero == 0) ? -1 : leadingZero;
            } else {
                i++;
                numLength++;
            }
        }
        if (numLength == 0) {
            return 0;
        }
        if (numLength > 10) {
            return isNeg ? -2147483648 : 2147483647;
        }
        int res = 0;
        i = 0;
        if (leadingZero > 0) {
            str = str.substring(leadingZero);
        }
        while (i < numLength) {
            res *= 10;
            res += str.charAt(i) - '0';
            i++;
        }
        if (str.charAt(numLength - 1) - '0' != res % 10) {
            return isNeg ? -2147483648 : 2147483647;
        }
        if (isNeg) {
            res *= -1;
        }
        return res;
    }

    public static void main(String[] args) {
        StringToInteger stringToInteger = new StringToInteger();
        System.out.println(stringToInteger.myAtoi("    0000000000000   "));
    }
}