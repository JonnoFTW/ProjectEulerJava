public class Prob17 {
	public static void main(String[] args) {
		long sum = 0;
		for(long i =0; i <= 1000; i++) {
			//System.out.printf("%,d: ",i);
			String s = num2Word(i);
			
			//System.out.println(s);
			sum += s.replace(" ", "").length();
		}
		System.out.println(sum);
	}
	static String[] nones = {"","one","two","three","four","five","six","seven",
		                  	 "eight","nine","ten","eleven","twelve","thirteen","fourteen",
			                 "fifteen","sixteen","seventeen","eighteen","nineteen"};
	static String[] tens = {"","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"};
	static String[] magnitudes = {"","thousand","million","billion","trillion","quadrillion","quintillion"};

	private static int numLen(long x) {
		return (int) Math.log10(x)+1;
	}
	private static String num2Word(long n) {
		StringBuilder out = new StringBuilder();
		if(n < 0){
			out.append("negative ");
			n = Math.abs(n);
		}
		String[] pieces = String.format("%,d",n).split(",");
		for (int i =0; i< pieces.length;i++) {
			out.append(three2Word(Integer.parseInt(pieces[i])));
			out.append(" "+magnitudes[pieces.length-i-1]+" ");
		}
		return out.toString();
	}
	private static String three2Word(int n) {
		int x = numLen(n);
		int td = n/10;
		int tr = n%10;
		int hd = n/100;
		int hr = n%100;
		
		if(x <= 2 && n < 20) {
			return nones[n];
		} else if (x==2 && n >= 20) {
			return tens[td] +" " +nones[tr];
		} else {
			String a;
			if(hr == 0) a = " ";
			else a = " and " + three2Word(hr);
			return nones[hd] + " hundred"+ a;
		}
	}
}
