package hi;

import java.util.Scanner;

public class ex6 {
    public static void main(String[] args) {
        // 自分の得意な言語で
        // Let's チャレンジ！！
        Scanner sc = new Scanner(System.in);
        int N= sc.nextInt();
        for(int i=0 ; i<N; i++) {
        	int M = sc.nextInt();
        	System.out.printf("%3d%n", M);
        }
    }

}
