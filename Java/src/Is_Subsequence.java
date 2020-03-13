/**
 * Created by Kray on 2016/12/25.
 */
public class Is_Subsequence {

    public static void main(String[] args) {
        Is_Subsequence is_subsequence = new Is_Subsequence();
        System.out.println(is_subsequence.isSubsequence("abc", "anboiwndoi"));
    }

    public boolean isSubsequence(String s, String t) {
        if(s.length() == 0){
            return true;
        }
        int iS = 0;
        int iT = 0;
        while(iT < t.length()){
            if(t.charAt(iT) == s.charAt(iS)){
                iS++;
            }
            if(iS == s.length()){
                return true;
            }
            iT++;
        }
        return false;
    }
}
