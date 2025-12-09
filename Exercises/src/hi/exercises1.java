package hi;
import java.util.Scanner;

public class exercises1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();

        // 1 行目: 1 〜 N/2
        for (int i = 1; i <= N / 2; i++) {
            System.out.print(i);
            if (i < N / 2) System.out.print(" ");
        }
        System.out.println();

        // 2 行目: N/2 + 1 〜 N
        for (int i = N / 2 + 1; i <= N; i++) {
            System.out.print(i);
            if (i < N) System.out.print(" ");
        }
        System.out.println();

        sc.close();
    }
}
