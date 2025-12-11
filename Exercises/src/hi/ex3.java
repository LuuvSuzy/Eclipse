package hi;
import java.util.Scanner;
public class ex3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();

        for (int i = 1; i <= N; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print(j);
                if (j < i) System.out.print(" "); // эгнээн доторх зай
            }
            System.out.println(); // мөр дуусахад шинэ мөр
        }
    }
}
