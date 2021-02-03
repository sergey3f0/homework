#include <iostream>
using namespace std;

bool isinside(int x1,int y1,int x2,int y2,int x,int y){

}

int main(){
	int n,m;
	scanf("%d%d",&n,&m);
	int wolves[n][4];
	int sheeps[m][2];
	for(int i = 0;i<n;i++){
		scanf("%d%d%d%d",&wolves[i][0],&wolves[i][1],&wolves[i][2],&wolves[i][3]);
	}
	for (int i = 0;i<m;i++){
		scanf("%d%d",&sheeps[i][0],&sheeps[i][1]);
	}
	
}
