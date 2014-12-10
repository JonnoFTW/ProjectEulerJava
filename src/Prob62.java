import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

public class Prob62 {
	public static HashMap<String, Map<Long,Long>> cubes = new HashMap<String, Map<Long,Long>>();

	public static void main(String[] args) {
		long start = System.nanoTime();
		long i = 0;
		while (true) {
			long cube = i * i * i;

			char[] chars = Long.toString(cube).toCharArray();
			Arrays.sort(chars);
			String s = new String(chars);		
			if (cubes.containsKey(s)) {
				cubes.get(s).put(i,cube);
			} else {
				Map<Long,Long> c = new TreeMap<Long,Long>();
				c.put(i,cube);
				cubes.put(s, c);
			}
			Map<Long,Long> cand = cubes.get(s);
			if (cand.size() == 5) {
				for (Entry<Long, Long> e: cand.entrySet()) {
					System.out.println(e.getKey()+" "+e.getValue());					
				}
				break;
			}
			i++;
		}
		System.out.println("Took: "+((System.nanoTime()-start)/1000000000f));
	}
}
