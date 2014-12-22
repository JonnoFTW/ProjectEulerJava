import java.util.ArrayList;
import java.util.HashSet;

public class Prob87 {
	private static long limit = 50000000;
	private static ArrayList<Integer> primes = new ArrayList<Integer>();
	private static HashSet<Long> tripsSimple = new HashSet<Long>();
	private static boolean isPrime(int n) {
		if (n < 2)return false;
		if (n == 2)return true;
		if (n % 2 == 0)return false;
		for (int i = 3; i < Math.sqrt(n) + 1; i += 2) {
			if (n % i == 0)return false;
		}
		return true;
	}
	public static void main(String[] args) {
		long started = System.nanoTime();
		float ns = 1000000000f;
		primes.add(2);
		for (int i = 3; i < limit; i += 2) {
			if (isPrime(i))
				primes.add(i);
			if(i*i >= limit) {
				System.out.println(primes.size()+ " primes up to "+i);
				break;
			}
		}
		for (int i = 0; i < primes.size(); i++) {
			long x=primes.get(i);
			long x4 = x*x*x*x;
			if(x4 > limit)
				break;
			for (int j = 0; j < primes.size();j++) {
				long y = primes.get(j);
				long y3 = y*y*y;
				if(y3 > limit || y3 + x4 > limit)
					break;
				for (int k = 0; k < primes.size(); k++) {
					long z = primes.get(k);
					long sum =z*z+y3+x4;
					if(sum > limit)
						break;
					if(sum < limit) {
						tripsSimple.add(sum);
					}
				}
			}
		}
		System.out.println(tripsSimple.size());
		System.out.println("Took: "+((System.nanoTime()-started)/ns)+"s");
	}
}