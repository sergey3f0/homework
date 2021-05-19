#include <iostream>
using namespace std;

bool isValid (string mat, int dim)
{
	if (dim < 2) {return true;}
	for (long unsigned i = 0; i < (mat.size())-dim;++i)
	{
		if((i+1)%dim != 0)
		{
			if((mat[i] == '1')&(mat[i+1] != '1')&(mat[i+dim] != '1'))
			{
				return false;
			}	
		}
	}
	return true;
}

int main()
{
	int all,cdim;
	string cmt,tmp;
	scanf ("%d",&all);
	for(int i = 0; i < all; ++i)
	{
		scanf ("%d",&cdim);
		cin >> cmt;
		for (int j = 1; j < cdim; ++j)
		{
			cin >> tmp;
			cmt += tmp;
		}
		if (isValid (cmt,cdim))
		{
			printf ("YES\n");
		}
		else
		{
			printf ("NO\n");
		}
	}
	return 0;
}
