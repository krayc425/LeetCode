import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kray on 2016/12/29.
 */
public class Fizz_Buzz {

    public static void main(String[] args) {
        Fizz_Buzz fizz_buzz = new Fizz_Buzz();
        ArrayList<String> strs = (ArrayList<String>) fizz_buzz.fizzBuzz(15000);
        for (String string : strs) {
            System.out.println(string);
        }
    }

    public List<String> fizzBuzz(int n) {
        ArrayList<String> strings = new ArrayList<>();
        for (int i = 1; i <= n; i++) {
            String result = "";
            if (i % 3 == 0) {
                result = result + "Fizz";
            }
            if (i % 5 == 0) {
                result = result + "Buzz";
            }
            if (result.equals("")) {
                result = result + i;
            }
            strings.add(result);
        }
        return strings;
    }
}
