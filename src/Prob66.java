
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;


public class Prob66 {

	public Prob66() {
		// TODO Auto-generated constructor stub
	}
	private static class Dio {
		double x;
		long y,d;
		Dio(double x, long l, long d2) {
			this.x = x;
			this.y = l;
			this.d = d2;
		}
		public String toString() {
			return String.format("%.0f^2 - %dx%d^2 = 1%n",x,d,y);
		}

	}
	private static double[] xs = new double[1000];
	private static List<Dio> ds = Collections.synchronizedList(new ArrayList<Dio>(1000));
	private static class MyRunner implements Runnable {
		private long d;
		private int dpos;
		public MyRunner(int i) {
			this.d = i;
			dpos = i;
		}
	
		@Override
		public void run() {
			if (Math.ceil(Math.sqrt(d)) - Math.floor(Math.sqrt(d)) == 0) {
				xs[dpos] = 0;
				System.out.println("No solution for "+d);
			} else {
				double x = 0.5;
				long i = 1;
				while (Math.abs(Math.ceil(x) - Math.floor(x)) > 0) {
					x = Math.sqrt(d * i * i + 1);
					i++;
				}
				xs[dpos] = x;
				//System.out.printf(;
				ds.add(new Dio(x, i-1, d));
			}
			
		}
	}

	public static void main(String[] args) throws InterruptedException {
		ExecutorService exec = Executors.newWorkStealingPool();
		long started = System.nanoTime();
		for (int i = 0; i < xs.length; i++) {
			exec.execute(new MyRunner(i));
		}
		exec.shutdown();
		exec.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
		/*double j =0;
		int maxD=0;
		for(int i = 0; i < xs.length;i++) {
			if(xs[i] > j) {
				j = xs[i];
				maxD = i;
			}
		}*/
		Collections.sort(ds,new Comparator<Dio>() {

			@Override
			public int compare(Dio o1, Dio o2) {
				return Double.compare(o1.x, o2.x);
			}
		});
		
		System.out.println(ds.get(ds.size()-1)+" ");
		long fin = System.nanoTime();
		System.out.println("Took: "+((fin-started)/1000000000f)+"s");
	}
}
