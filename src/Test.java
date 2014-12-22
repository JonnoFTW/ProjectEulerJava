public class Test {
	private strictfp static double pown(long x, int n) {
		double sum =1;
		for (int i = 0; i < n; i++) {
			sum *= x;
		}
		return sum;
	}
	private strictfp static double pow(double x, int n) {
		if(n < 0) return pow(1/x,-n);
		else if(n==0)return 1;
		else if(n==1)return x;
		else if(n%2==0) return pow(x*x,n/2);
		else return x*pow(x*x,(n-1)/2);
	}
	public static void main(String[] args) {
		
		System.out.println(pown(2,100));
		System.out.println(pow(2,100));
		System.out.println(Math.pow(2,100));
		int lim =100000000;
		long started = System.nanoTime();
		for (int i = 0; i < lim; i++) {
			pow(2,100);
		}
		float ns = 1000000000f;
		System.out.println("Custom Took: "+((System.nanoTime()-started)/ns)+"s");
		started = System.nanoTime();
		for (int i = 0; i < lim; i++) {
			Math.pow(2,100);
		}
		System.out.println("builtin Took: "+((System.nanoTime()-started)/ns)+"s");
		started = System.nanoTime();
		for (int i = 0; i < lim; i++) {
			pown(2,100);
		}
		System.out.println("naive Took: "+((System.nanoTime()-started)/ns)+"s");
	}
}
