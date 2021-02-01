#include <iostream>
#include <math.h>
	int compare(const void * a, const void * b){
	return (*(int*) a - *(int*) b);
} 
class flt{
	public:
		int mnt,exp;
};

int main(){
	int a;
	scanf("%d",&a);
	flt s[a];
	int students[a];
	for (int i = 0;i<a;i++){
		scanf("%d%*c%d",&s[i].mnt,&s[i].exp);
		students[i] = (s[i].mnt*1000000)+s[i].exp;
	}

	qsort(students,a,sizeof(int),compare);
	int optimal;
	for (int point = 0; point<a; point++){
		if (std::max((students[point]-students[0]),(students[a-1]-students[point]))<std::max((students[optimal]-students[0]),(students[a-1]-students[optimal]))){
			optimal=point;
		}
	}
}
