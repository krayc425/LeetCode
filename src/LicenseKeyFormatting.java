public class LicenseKeyFormatting {
    public String licenseKeyFormatting(String S, int K) {
        StringBuilder sb = new StringBuilder();
        for (String s : S.split("-")) {
            sb.append(s.toUpperCase());
        }
        String s_withoutDash = sb.toString();
        int firstLen = s_withoutDash.length() % K;
        StringBuilder result = new StringBuilder();
        result.append(s_withoutDash.substring(0, firstLen));
        for (int i = firstLen; i < s_withoutDash.length(); i += K) {
            if (result.length() > 0) {
                result.append("-");
            }
            result.append(s_withoutDash.substring(i, i + K));
        }
        return result.toString();
    }

    public static void main(String[] args) {
        LicenseKeyFormatting licenseKeyFormatting = new LicenseKeyFormatting();
        System.out.println(licenseKeyFormatting.licenseKeyFormatting("5F3Z-2e-9-w", 3));
    }
}
