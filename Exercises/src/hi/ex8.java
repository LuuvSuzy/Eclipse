package hi;
import java.util.Scanner;

public class ex8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt(); // тоонуудын тоо
        int M = sc.nextInt(); // хэдэн орон болгох

        // M-д таарсан формат үүсгэнэ
        String format = "%" + M + "d%n";

        for (int i = 0; i < N; i++) {
            int A = sc.nextInt();   // A_i
            System.out.printf(format, A);
        }

        sc.close();
    }
}
