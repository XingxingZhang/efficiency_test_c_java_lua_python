package java_sort;

import java.util.*;
import java.io.*;

public class TestSort {
	
	static int[] loadRandNumbers(String infile)
	{
		ArrayList<Integer> arr = new ArrayList<Integer>();
		try{
			long start = Calendar.getInstance().getTimeInMillis();
			BufferedReader br = new BufferedReader(new BufferedReader(new FileReader(infile)));
			String line = null;
			while((line = br.readLine()) != null)
				arr.add(Integer.parseInt(line));
			br.close();
			long end = Calendar.getInstance().getTimeInMillis();
			System.out.printf("load data time spend %f s\n", (double)(end - start) / 1000);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		int []a = new int[arr.size()];
		for(int i = 0; i < arr.size(); i ++)
			a[i] = arr.get(i);
		
		return a;
	}
	
	static void quickSort(int []a, int begin, int end)
	{
		if(begin >= end) return;
		int tmp = a[begin];
		int low = begin, high = end;
		while( low != high )
		{
			while( low != high && a[high] >= tmp )
				high --;
			if( low != high ) a[low] = a[high];
			while( low != high && a[low] <= tmp )
				low ++;
			if( low != high ) a[high] = a[low];
		}
		a[low] = tmp;
		quickSort(a, begin, low - 1);
		quickSort(a, low + 1, end);
	}
	
	public static void main(String args[])
	{
		if(args.length != 1)
		{
			System.err.println("test_sort infile");
			return;
		}
		int []a = loadRandNumbers(args[0]);
		// int []a = {8, 6, 1, 3, 8, 6, 15, 10, 13, 10, 10};
		int []b = Arrays.copyOf(a, a.length);
		if(a.length <= 20)
		{
			System.out.println(Arrays.toString(a));
			// System.out.println(Arrays.toString(b));
		}
		long tstart = Calendar.getInstance().getTimeInMillis();
		quickSort(a, 0, a.length - 1);
		System.out.printf("quick sort spend %f s\n", 
				(double)(Calendar.getInstance().getTimeInMillis() - tstart) / 1000);
		if(a.length <= 20)
		{
			System.out.println(Arrays.toString(a));
		}
		System.arraycopy(b, 0, a, 0, b.length);
		if(a.length <= 20)
		{
			System.out.println(Arrays.toString(a));
		}
		tstart = Calendar.getInstance().getTimeInMillis();
		Arrays.sort(a);
		// quickSort(a, 0, a.length - 1);
		System.out.printf("Arrays.sort spend %f s\n", 
				(double)(Calendar.getInstance().getTimeInMillis() - tstart) / 1000);
		if(a.length <= 20)
		{
			System.out.println(Arrays.toString(a));
		}
	}

}
