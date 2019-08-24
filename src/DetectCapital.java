public class DetectCapital {
    public boolean detectCapitalUse(String word) {
        return (word.toUpperCase().equals(word) || word.toLowerCase().equals(word) || isOnlyFirstCap(word));
    }

    private boolean isOnlyFirstCap(String word) {
        if (word.length() == 0) {
            return false;
        }
        if (word.charAt(0) >= 'A' && word.charAt(0) <= 'Z') {
            for (char c : word.substring(1).toCharArray()) {
                if (c >= 'A' && c <= 'Z') {
                    return false;
                }
            }
            return true;
        } else {
            return false;
        }
    }

    public static void main(String[] args) {
        DetectCapital detectCapital = new DetectCapital();
        System.out.println(detectCapital.detectCapitalUse("ffFD"));
    }

}
