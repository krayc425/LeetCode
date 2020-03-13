/**
 * Created by Kray on 2016/12/25.
 */
public class Add_Strings {

    public static void main(String[] args) {
        Add_Strings add_strings = new Add_Strings();
        System.out.println(add_strings.addStrings("999999999999", "9999999999999999999999"));
    }

    public String addStrings(String num1, String num2) {
        int length1 = num1.length();
        int length2 = num2.length();
        String result = "";
        int deltaZeros = 0;
        deltaZeros = length1 - length2; //deltaZero > 0 : num1长; deltaZero < 0 : num2长
        if (deltaZeros > 0) {
            while (deltaZeros != 0) {
                num2 = "0" + num2;
                deltaZeros--;
            }
        } else {
            while (deltaZeros != 0) {
                num1 = "0" + num1;
                deltaZeros++;
            }
        }
        int carry = 0;
        for (int i = num1.length() - 1; i >= 0; i--) {
            result = addNumbers(charToInt(num1.charAt(i)), charToInt(num2.charAt(i)), carry) + result;
            carry = hasCarry(charToInt(num1.charAt(i)), charToInt(num2.charAt(i)), carry);
        }
        if (carry != 0) {
            result = carry + result;
        }
        return result;
    }

    private int charToInt(char c) {
        return (c - 48);
    }

    private int addNumbers(int n1, int n2, int carry) {
        return (n1 + n2 + carry) % 10;
    }

    private int hasCarry(int n1, int n2, int carry) {
        return ((n1 + n2 + carry) / 10);
    }
}
