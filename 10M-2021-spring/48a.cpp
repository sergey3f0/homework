#include <iostream>
using namespace std;

int main(){
	int a[3];
	string tmp;
	for (int i = 0; i<3; ++i) 
	{
		cin >> tmp;
		if (tmp == "rock")
		{
			a[i] = 0;
		}
		else
		{
			if (tmp == "paper")
			{
				a[i] = 1;
			}
			else
			{
				a[i] = 3;
			}
		}
	}
	switch (a[0]+a[1]+a[2])
	{
		case 0:
		case 2:
		case 3:
		case 4:
		case 7:
		case 9:
			printf ("?");
			return 0;
		case 1:
			if (a[0] == 1)
			{
				printf ("F");
			}
			else
			{
				if (a[1] == 1)
				{
					printf ("M");
				}
				else
				{
					printf ("S");
				}
			}
			return 0;
		case 5:
			if (a[0] == 3)
			{
				printf ("F");
			}
			else
			{
				if (a[1] == 3)
				{
					printf ("M");
				}
				else
				{
					printf ("S");
				}
			}
			return 0;
		case 6:
			if (a[0] == 0)
			{
				printf ("F");
			}
			else
			{
				if (a[1] == 0)
				{
					printf ("M");
				}
				else
				{
					printf ("S");
				}
			}
	
			return 0;
	}
}

