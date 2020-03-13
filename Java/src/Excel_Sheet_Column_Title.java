/**
 * Created by Kray on 2016/12/23.
 */
public class Excel_Sheet_Column_Title {
    /**
     * Main
     *
     * @param args
     */
    public static void main(String[] args) {
        Excel_Sheet_Column_Title excel_sheet_column_title = new Excel_Sheet_Column_Title();
        System.out.println(excel_sheet_column_title.convertToTitle(53));
    }

    /**
     * 转换函数
     *
     * @param n
     */
    public String convertToTitle(int n) {
        return n > 26 ? convertToTitle((n - 1) / 26) + (char) (n - (int) ((n - 1) / 26) * 26 + 64) : (char) (n + 64) + "";
    }
}
