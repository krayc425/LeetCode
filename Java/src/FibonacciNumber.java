public class FibonacciNumber {
    public int fib(int N) {
        if (N == 0 || N == 1) {
            return N;
        }
        int f1 = 0;
        int f2 = 1;
        int i = 1;
        while (i < N) {
            f2 = f1 + f2;
            f1 = f2 - f1;
            i += 1;
        }
        return f2;
    }

    public static void main(String[] args) {
        FibonacciNumber f = new FibonacciNumber();
        System.out.println(f.fib(30));
    }
}
