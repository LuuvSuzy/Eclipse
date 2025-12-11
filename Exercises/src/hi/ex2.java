package hi;
import java.util.Scanner;
public class ex2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int N= sc.nextInt();
		int M = sc.nextInt();
		
		//ehnii mur 
		for(int i=1; i<=N; i++) {
			System.out.print(i);
			if(i<N) System.out.print(" ");
		}
		System.out.println();
		// 2dahi mur 
		for(int i=1; i<=M; i++) {
			System.out.print(i);
			if(i<M) System.out.print(" ");
		}
		System.out.println();
	}

}
