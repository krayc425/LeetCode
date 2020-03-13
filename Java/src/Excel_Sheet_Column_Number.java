/**
 * Created by Kray on 2016/12/27.
 */
public class Excel_Sheet_Column_Number {

    public static void main(String[] args) {
        Excel_Sheet_Column_Number excel_sheet_column_number = new Excel_Sheet_Column_Number();
        System.out.println(excel_sheet_column_number.titleToNumber("AC"));
    }

    public int titleToNumber(String s) {
        int result = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            result += (s.charAt(i) - 'A' + 1) * Math.pow(26, s.length() - i - 1);
        }
        return result;
    }
}
