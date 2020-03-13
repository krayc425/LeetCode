/**
 * Created by Kray on 2017/1/14.
 */
public class Number_of_Segments_in_a_String {

    public static void main(String[] args) {
        Number_of_Segments_in_a_String n = new Number_of_Segments_in_a_String();
        System.out.println(n.countSegments(""));
    }

    public int countSegments(String s) {
        return ("s " + s).trim().split(" +").length - 1;
    }
}
