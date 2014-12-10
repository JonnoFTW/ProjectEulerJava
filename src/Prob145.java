import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;



public class Prob145 {

	private static int numLen(long d) {
		return (int) Math.ceil(Math.log10(d));
	}

	private static boolean allOdd(long d) {
		int len = numLen(d);
		double lim = Math.pow(10,len);
		for(int i =10; i <= lim;i*=10) {
			int p = (int) ((d%i)/(i/10));
			if(p%2==0)
				return false;
		}
		return true;
	}
	private static boolean allOddChar(long d) {
		String s = Long.toString(d);
		if(s.endsWith("0"))
			return false;
		for (char c : Long.toString(d).toCharArray()) {
			switch (c) {
			case '0':
			case '2':
			case '4':
			case '6':
			case '8':
				return false;

			}
		}
		return true;
	}
	private static class MyRunner implements Runnable {

		Long s ;
		MyRunner(long i) {
			s = i;
		}
		@Override
		public void run() {
			long c = 0;
			for(Long j=s+1; j < limit;j+=procStep) {
				long rev = Long.parseLong((new StringBuilder(j+"")).reverse().toString());
				if(numLen(rev) == numLen(j) && allOdd(j+ rev)) {
					c++;
				}
			}
			count.addAndGet(c);
		}
	}
	private static AtomicLong count = new AtomicLong();
	private static long limit = 100000000;
	private static int procStep = Runtime.getRuntime().availableProcessors();
	public static void main(String[] args ) throws InterruptedException {
		long start = System.nanoTime();
		ExecutorService ts = Executors.newWorkStealingPool();
		for(long i =0; i < Runtime.getRuntime().availableProcessors(); i++) {
			ts.execute(new MyRunner(i));
		}
		ts.shutdown();
		ts.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);
		System.out.println("took "+(System.nanoTime()-start)/1000000000f+"s");
		System.out.println(count.toString());
		
	}

}
