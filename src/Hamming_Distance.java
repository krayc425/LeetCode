/**
 * Created by Kray on 2016/12/30.
 */
public class Hamming_Distance {

    public static void main(String[] args) {
        Hamming_Distance h = new Hamming_Distance();
        System.out.println(h.hammingDistance(1, 4));
    }

    public int hammingDistance(int x, int y) {
        int temp = x ^ y;
        int count = 0;
        while (temp != 0) {
            if ((temp & 1) == 1) {
                count++;
            }
            temp >>= 1;
        }
        return count;
    }
}
