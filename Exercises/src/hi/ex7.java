package hi;
import java.util.Scanner;
public class ex7 {
	 public static void main(String[] args) {
	        // 自分の得意な言語で
	        // Let's チャレンジ！！
	        Scanner sc = new Scanner(System.in);
	        int N= sc.nextInt();
	        int M = sc.nextInt();
	        String format = "%"+M+"d%n";
	        System.out.printf(format, N);
	    }
}
