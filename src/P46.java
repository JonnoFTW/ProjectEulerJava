public class P46 {
	public static void main(String[] args) {
		int i =9;
		while(true) {
			if(!isPrime(i) && !gb(i)) {
				System.out.println(i);
				break;
			}
			i+=2;
		}
	}
	private static boolean isPrime(int n) {
		    if (n<2) return false;
		    if (n==2) return true;
		    if (n%2==0)return false;
		    for (int i =3; i < Math.sqrt(n)+1;i+=2)  {
		        if (n%i==0)
		            return false; 
		    }
		    return true;
	}
	private static boolean gb(int x){
		
		for (int i=2; i < x; i+=2) {
			if (!isPrime(i)) {
				continue;
			}
			for (int j =1; j < i;j++) {
				if( i + (2 * (j*j)) == x) {
					System.out.printf("%d = %d + 2x%d^2%n",x,i,j);
					return true;
				}
			}
			if(i==2)
				i++;
		}
		return false;
	}
}
