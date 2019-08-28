public class Base7 {
    public String convertToBase7(int num) {
        if (Math.abs(num) < 7) {
            return num + "";
        }
        boolean isNeg = num < 0;
        num = Math.abs(num);
        int i = 1;
        while (i <= num) {
            i *= 7;
        }
        i /= 7;
        StringBuilder sb = new StringBuilder();
        int count = 0;
        while (i > 1) {
            while (num >= i) {
                num -= i;
                count += 1;
            }
            sb.append(count);
            count = 0;
            i /= 7;
        }
        sb.append(num);
        if (isNeg) {
            sb.insert(0, '-');
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        Base7 base7 = new Base7();
        System.out.println(base7.convertToBase7(-100));
    }
}
