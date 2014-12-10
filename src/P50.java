import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class P50 {

	private static Set<Integer> primeSet = new HashSet<Integer>();
	private static ArrayList<Integer> primes = new ArrayList<Integer>();
	private static List<Integer> longestSubList = new ArrayList<Integer>();
	private static final int limit = 1000000;
	public P50() {
		int max =0;
		for (int i =0; i < primes.size(); i++) {
			for (int j = Math.max(i+1,longestSubList.size()); j < primes.size(); j++) {
				List<Integer> sub = primes.subList(i, j);
				if(sub.size() < longestSubList.size())
					continue;
				int sum = sum(sub);			
				if(sum > limit)
					break;
				if(isPrime(sum)) {
					max = sum;
					longestSubList = sub;
				}
			}
		}
		System.out.println("Sum="+max+" len="+longestSubList.size());
	}

	private static int sum(List<Integer> xs) {
		int i =0;
		for (Integer integer : xs) {
			i+= integer;
		}
		return i;
	}
	public static void main(String[] args) {
		long started = System.nanoTime();
		primeSet.add(2);
		for(int i =3;i < limit;i+=2) {
			if(isPrime(i)) 
				primeSet.add(i);
		}
		primes.addAll(primeSet);
		Collections.sort(primes);
		
		new P50();
		long fin = System.nanoTime();
		System.out.println("Took: "+((fin-started)/1000000000f)+"s");
	}
	
	private static boolean isPrime(int n) {
		if (primeSet.contains(n)) return true;
	    if (n<2) return false;
	    if (n==2) return true;
	    if (n%2==0)return false;
	    for (int i =3; i < Math.sqrt(n)+1;i+=2)  {
	        if (n%i==0)
	            return false; 
	    }
	    return true;
	}
}