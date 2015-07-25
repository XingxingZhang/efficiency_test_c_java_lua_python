
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <memory.h>
#include <iostream>
#include <algorithm>
using namespace std;

const int MAXN = 100000005;
int a[MAXN];
int b[MAXN];

int loadRandNumbers(const char *infile, int a[])
{
	char buf[1024];
	clock_t start = clock();
	FILE *fin = fopen(infile, "r");
	int i = 0;
	while( fgets(buf, sizeof(buf), fin) )
		a[i++] = atoi(buf);
	fclose(fin);
	printf("load time spend %f s\n", double(clock() - start) / CLOCKS_PER_SEC);
	
	return i;
}

void print_arr(int a[], int N)
{
	for(int i = 0; i < N; i ++)
		printf("%d ", a[i]);
	putchar('\n');
}

void copy_arr(int a[], int b[], int N)
{
	memcpy(a, b, sizeof(a[0]) * N);
}

void _quick_sort(int a[], int istart, int iend)
{
	if(istart >= iend)
		return;
	int low = istart, high = iend;
	int tmp = a[istart];
	while( low != high )
	{
		while(low != high && tmp <= a[high]) high --;
		if(low != high) a[low] = a[high];
		while(low != high && tmp >= a[low]) low ++;
		if(low != high) a[high] = a[low];
	}
	a[low] = tmp;
	_quick_sort(a, istart, low - 1);
	_quick_sort(a, low + 1, iend);
}

void quick_sort(int a[], int N)
{
	_quick_sort(a, 0, N-1);
}

int cmp(const void *a, const void *b)
{
	return *((int*)a) - *((int*)b);
}

int main(int argc, char **argv)
{
	if(argc != 2)
	{
		fprintf(stderr, "test_sort <random_number_file>\n");
		return 1;
	}
	int N = loadRandNumbers(argv[1], a);
	copy_arr(b, a, N);
	if(N <= 20)
		print_arr(a, N);
	size_t start = clock();
	quick_sort(a, N);
	printf("quick_sort time spend %f s\n", double(clock() - start)/CLOCKS_PER_SEC);
	if(N <= 20)
		print_arr(a, N);
	copy_arr(a, b, N);
	if(N <= 20)
		print_arr(a, N);
	start = clock();
	qsort(a, N, sizeof(int), cmp);
	printf("native qsort time spend %f s\n", double(clock() - start)/CLOCKS_PER_SEC);
	if(N <= 20)
		print_arr(a, N);

	copy_arr(a, b, N);
	if(N <= 20)
		print_arr(a, N);
	start = clock();
	// qsort(a, N, sizeof(int), cmp);
	sort(a, a + N);
	printf("native algorithm sort time spend %f s\n", double(clock() - start)/CLOCKS_PER_SEC);
	if(N <= 20)
		print_arr(a, N);

	return 0;
}
