#include<iostream>
using namespace std;

int intsqrt()
{
	int k,a,b;
	cin >> k;
	a = 0;
	b = k;
	while ((abs(a-b)) > 1) 
	{
		if (((a+b)/2)*((a+b)/2) > k)
		{
			b = (a+b)/2;
		}
		else
		{
			a = (a+b)/2;
		}
	}
	return a;
}

