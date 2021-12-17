#include<iostream>
#include<cmath>
using namespace std;

int main()
{
	int a,b;
	cin >> a >> b;
	int s = a+2*b;
	double x = floor(sqrt(s));
	if(s<=x*x)
	{
		cout << 4*(int(x)) << endl;
	}
	else if ( s<= x*(x+1))
	{
		cout << 2*(int(x)+int(x+1)) << endl;
	}
	else if (s <= (x+1)*(x+1))
	{
		cout << 4*(int(x+1)) << endl;
	}
}
