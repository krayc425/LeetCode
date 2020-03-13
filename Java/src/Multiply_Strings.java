public class Multiply_Strings {
    public String multiply(String num1, String num2) {
        if (num1.equals("0") || num2.equals("0")) {
            return "0";
        }
        String longNum = num1.length() > num2.length() ? num1 : num2;
        String shortNum = longNum.equals(num1) ? num2 : num1;
        int delta = 0;
        String result = "0";
        for (int i = shortNum.length() - 1; i >= 0; i--) {
            String temp = multiLongWithDigit(longNum, shortNum.charAt(i) - '0');
            result = addTwoNumbers(result, temp, delta);
            delta++;
        }
        return result;
    }

    private String multiLongWithDigit(String longNum, int digit) {
        StringBuilder sb = new StringBuilder();
        int carry = 0;
        for (int i = longNum.length() - 1; i >= 0; i--) {
            int r = (longNum.charAt(i) - '0') * digit + carry;
            sb.append(r % 10);
            carry = r / 10;
        }
        if (carry > 0) {
            sb.append(carry);
        }
        return sb.reverse().toString();
    }

    private String addTwoNumbers(String longNum, String numToAdd, int delta) {
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (i < delta) {
            sb.append(longNum.charAt(longNum.length() - 1 - i));
            i++;
        }
        longNum = longNum.substring(0, longNum.length() - delta);
        while (longNum.length() < numToAdd.length()) {
            longNum = "0" + longNum;
        }
        int carry = 0;
        for (int j = numToAdd.length() - 1; j >= 0; j--) {
            int res = numToAdd.charAt(j) + longNum.charAt(j) - '0' - '0' + carry;
            sb.append(res % 10);
            carry = res / 10;
        }
        if (carry > 0) {
            sb.append(carry);
        }
        return sb.reverse().toString();
    }

    public static void main(String[] args) {
        Multiply_Strings m = new Multiply_Strings();
        System.out.println(m.multiply("123456789","123456789"));
    }

}
