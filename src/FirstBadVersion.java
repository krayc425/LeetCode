public class FirstBadVersion {
    public int firstBadVersion(int n) {
        int low = 1;
        int high = n;
        int res = -1;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (isBadVersion(mid)) {
                res = mid;      // might not be the answer
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return res;
    }

    private boolean isBadVersion(int n) {
        return true;
    }
}
