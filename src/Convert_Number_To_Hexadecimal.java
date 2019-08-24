import java.util.HashMap;
import java.util.Map;

public class Convert_Number_To_Hexadecimal {

    Map<String, String> decToHex = new HashMap<String, String>() {{
        put("0000", "0");
        put("0001", "1");
        put("0010", "2");
        put("0011", "3");
        put("0100", "4");
        put("0101", "5");
        put("0110", "6");
        put("0111", "7");
        put("1000", "8");
        put("1001", "9");
        put("1010", "a");
        put("1011", "b");
        put("1100", "c");
        put("1101", "d");
        put("1110", "e");
        put("1111", "f");
    }};

    public String toHex(int num) {
        if (num == 0) {
            return "0";
        }
        if (num == -2147483648) {
            return "80000000";
        }
        boolean isNeg = num < 0;
        num = Math.abs(num);
        String binary = decToBinary(num);
        if (isNeg) {
            binary = binaryAddOne(binary);
        }
        return binaryToHex(binary, isNeg);
    }

    private String decToBinary(int num) {
        StringBuilder result = new StringBuilder();
        while (num > 0) {
            result.append(num % 2);
            num /= 2;
        }
        result.reverse();
        return result.toString();
    }

    private String binaryAddOne(String binary) {
        StringBuilder stringBuilder = new StringBuilder();
        binary = binary.replace('0', '2');
        binary = binary.replace('1', '0');
        binary = binary.replace('2', '1');
        int carry = 0;
        for (int i = 0; i < binary.length(); i++) {
            int bit = binary.charAt(binary.length() - i - 1) - '0';
            int result = bit + carry + (i == 0 ? 1 : 0);
            if (result > 1) {
                result -= 2;
                carry = 1;
            } else {
                carry = 0;
            }
            stringBuilder.append(result);
        }
        if (carry == 1) {
            stringBuilder.append(1);
        }
        stringBuilder.reverse();
        return stringBuilder.toString();
    }

    private String binaryToHex(String binary, boolean isNeg) {
        StringBuilder binaryBuilder = new StringBuilder();
        binaryBuilder.append(binary);
        binaryBuilder.reverse();
        if (isNeg) {
            for (int i = 0; i < 32 - binary.length(); i++) {
                binaryBuilder.append('1');
            }
        } else {
            if (binary.length() % 4 != 0) {
                for (int i = 0; i < 4 - binary.length() % 4; i++) {
                    binaryBuilder.append('0');
                }
            }
        }
        binary = binaryBuilder.reverse().toString();
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < binary.length(); i += 4) {
            res.append(decToHex.get(binary.substring(i, i + 4)));
        }
        return res.toString();
    }

    public static void main(String[] args) {
        Convert_Number_To_Hexadecimal convert_number_to_hexadecimal = new Convert_Number_To_Hexadecimal();
        System.out.println(convert_number_to_hexadecimal.toHex(-2147483648));
    }

}
