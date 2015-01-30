class Prob123 {
	static boolean isPrime(long n) {
	    if (n<2) return false;
	    if (n==2) return true;
	    if (n%2==0)return false;
	    int limit = (int) (Math.sqrt(n)+1);
	    for (int i =3; i < limit;i+=2)  {
	        if (n%i==0)
	            return false; 
	    }
	    return true;
	}
	public static void main(String[] args) {
		// pn is the nth prime
		for(long n=1, pn=1;;n++) {
			while(!isPrime(pn)) {
				pn++;
			}
			if(n%2 ==1 && 2*n*pn > 100000000000l){
				System.out.println(n);
				return;
			}
			pn++;
		}
	}
}