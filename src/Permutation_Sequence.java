/**
 * Created by Kray on 2016/12/27.
 */
public class Permutation_Sequence {

    public static void main(String[] args) {
        Permutation_Sequence permutation_sequence = new Permutation_Sequence();
        System.out.println(permutation_sequence.getPermutation(4, 1));
    }

    public String getPermutation(int n, int k) {
        int[] nums = new int[n];
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        return getPermutationInArray(nums, k - 1);
    }

    private String getPermutationInArray(int n[], int k) {
        if (n.length == 1) {
            return n[0] + "";
        }
        int temp = factorial(n.length - 1);
        int group = k / temp;
        int indexInGroup = k - group * temp;
        return n[group] + getPermutationInArray(removeNumFromArray(n, n[group]), indexInGroup);
    }

    private int factorial(int n) {
        if (n == 0 || n == 1) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }

    private int[] removeNumFromArray(int n[], int num) {
        int m[] = new int[n.length - 1];
        int j = 0;
        for (int i = 0; i < n.length; i++) {
            if (n[i] != num) {
                m[j++] = n[i];
            }
        }
        return m;
    }
}
