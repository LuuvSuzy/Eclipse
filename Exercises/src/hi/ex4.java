package hi;
import java.util.Scanner;

public class ex4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int N= sc.nextInt();
		int [] M= new int[N];
		
		for(int i=0 ; i<N; i++) {
			M[i]=sc.nextInt();
		}
			for(int i=0; i<N; i++) {
				int limit = M[i];
				
				for(int num=1; num<=limit ; num++ ) {
					System.out.print(num);
					if(num<limit) {
						System.out.print(" ");
					}
			}
				System.out.println();
		}
		
	}
}
