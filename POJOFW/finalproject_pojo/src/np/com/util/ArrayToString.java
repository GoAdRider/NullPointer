package np.com.util;

import java.util.StringTokenizer;

public class ArrayToString {
	
	public void methodA() {
		StringBuilder strA = new StringBuilder();
		StringBuilder strB = new StringBuilder();
		StringBuilder strC = new StringBuilder();
		String[] strArray = {"명란 100 g","고추장 4 T"};
		
	}
	
	public void methodB() {
		String str = "과자,명란";
		  StringTokenizer st = new StringTokenizer(str, ",");
		  String [] array = new String[st.countTokens()];
		  int i = 0;
		  while(st.hasMoreElements()){
		   array[i++] = st.nextToken();
		  }
		  for(i=0; i < array.length ; i++){
		  System.out.println(array[i]); 
		  }
	}
	
	public static void main(String[] args) {
		ArrayToString ats = new ArrayToString();
//		ats.methodA();
		ats.methodB();
	}

}
