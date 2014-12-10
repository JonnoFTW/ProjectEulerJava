import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;



public class Prob206 {
	private static boolean running = true;
	private static Pattern p = Pattern.compile("1\\d2\\d3\\d4\\d5\\d6\\d7\\d8\\d9\\d0");

	private static class MyRunner implements Runnable {
		int s;
		public MyRunner(int s) {
			this.s = s;
		}
		@Override
		public void run() {
			long i = 10000000;
			i+=10*s;
			while(running) {
				i+=10;
				long square = i*i;
				if(p.matcher(Long.toString(square)).matches()) {
					running = false;
					System.out.println(i+" "+i*i);
					return;
				}
			}
		}
		
	}
	public static void main(String[] args) throws InterruptedException {
		ExecutorService ts = Executors.newWorkStealingPool();
		long started = System.nanoTime();
		for(int i =0; i < Runtime.getRuntime().availableProcessors(); i++) {
			ts.execute(new MyRunner(i));
		}
		ts.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);
		long fin = System.nanoTime();
		System.out.println("Took: "+((fin-started)/1000000000f)+"s");
	}

}
