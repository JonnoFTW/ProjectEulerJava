import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

public class Prob87 {

	public Prob87() {
		// TODO Auto-generated constructor stub

	}
	private static long limit = 5000000;
	private static AtomicLong count = new AtomicLong();
	private static int procStep = Runtime.getRuntime().availableProcessors();
	private static ArrayList<Integer> primes = new ArrayList<Integer>();
	private static boolean isPrime(int n) {
		if (n < 2)
			return false;
		if (n == 2)
			return true;
		if (n % 2 == 0)
			return false;
		for (int i = 3; i < Math.sqrt(n) + 1; i += 2) {
			if (n % i == 0)
				return false;
		}
		return true;
	}

	private static class MyRunner implements Runnable {
		private int i;

		public MyRunner(int i) {
			this.i = i;
		}

		@Override
		public void run() {
			for(int j =28+i; j < limit;j+=procStep) {
				if(powerTriple(j))
					count.incrementAndGet();
				if(j%100000==0) {
					System.out.println(j);
				}
			}
		}
		private static boolean powerTriple(int j) {
			for(int k=0;k<primes.size();k++) {
				long k1 = primes.get(k);
				long k2 =k1*k1*k1*k1;
				if(k2>j)
					break;
				for(int m=0;m<primes.size();m++) {
					long m2 = primes.get(m);
					long m3 = m2*m2*m2;
					if(m3>j || m3 + k2 >=j) 
						break;
					for(int n=0;n<primes.size();n++) {
						long n3 = primes.get(n);
						long n4 = n3*n3;
						if(n4>j)
							break;
						long sum =k2+ m3 + n4 ; 
						if(sum== j) {
						//	System.out.printf("%d = %d^2 + %d^3 + %d^4%n",j,n3,m2,k1);
							return true;
						}
						if(sum > j)
							break;
					}
				}
			}
			return false;
		}

	}

	public static void main(String[] args) throws InterruptedException {
		
		primes.add(2);
		for (int i = 3; i < limit; i += 2) {
			if (isPrime(i))
				primes.add(i);
			if(i*i >= limit) {
				System.out.println(primes.size()+ " primes up to "+i);
				break;
			}
			
		}
		System.out.println("Searching");
		long started = System.nanoTime();
		ExecutorService exec = Executors.newWorkStealingPool();
		for (int i = 0; i < procStep; i++) {
			exec.execute(new MyRunner(i));
		}
		exec.shutdown();
		exec.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
		System.out.println("Num="+count);
		long fin = System.nanoTime();
		System.out.println("Took: "+((fin-started)/1000000000f)+"s");
	}

}
