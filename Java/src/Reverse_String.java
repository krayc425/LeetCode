/**
 * Created by Kray on 2016/12/28.
 */
public class Reverse_String {

    public static void main(String[] args) {
        Reverse_String reverse_string = new Reverse_String();
        System.out.println(reverse_string.reverseString("hello"));
    }

    public String reverseString(String s) {
//        if(s.length() <= 1){
//            return s;
//        }
//        return s.charAt(s.length() - 1) + reverseString(s.substring(1, s.length() - 1)) + s.charAt(0);
        StringBuilder sb = new StringBuilder();
        for (int i = s.length() - 1; i >= 0; i--) {
            sb.append(s.charAt(i));
        }
        return sb.toString();
    }
}
