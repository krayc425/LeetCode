public class Integer_to_Roman {
    public String intToRoman(int num) {
        StringBuilder sb = new StringBuilder();
        
        while (num >= 1000) {
            sb.append('M');
            num -= 1000;
        }

        if (num >= 900) {
            sb.append("CM");
            num -= 900;
        } else if (num >= 500) {
            sb.append('D');
            num -= 500;
            while (num >= 100) {
                sb.append("C");
                num -= 100;
            }
        } else if (num >= 400) {
            sb.append("CD");
            num -= 400;
        } else {
            while (num >= 100) {
                sb.append("C");
                num -= 100;
            }
        }

        if (num >= 90) {
            sb.append("XC");
            num -= 90;
        } else if (num >= 50) {
            sb.append('L');
            num -= 50;
            while (num >= 10) {
                sb.append("X");
                num -= 10;
            }
        } else if (num >= 40) {
            sb.append("XL");
            num -= 40;
        } else {
            while (num >= 10) {
                sb.append("X");
                num -= 10;
            }
        }

        if (num >= 9) {
            sb.append("IX");
        } else if (num >= 5) {
            sb.append('V');
            num -= 5;
            while (num >= 1) {
                sb.append("I");
                num -= 1;
            }
        } else if (num >= 4) {
            sb.append("IV");
        } else {
            while (num >= 1) {
                sb.append("I");
                num -= 1;
            }
        }

        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(new Integer_to_Roman().intToRoman(1994));
    }
}
