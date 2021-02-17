#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
	string filename;
	cin >> filename;
	ifstream mdfile (filename+".md");
	string line,file;
	
	while (getline (mdfile,line)){
		file=file+"\n"+line;
	}
	
	int strings=0;
	for(long unsigned i=0;i<file.size();i++){
		if(file[i]=='\n'){strings++;}
	}
	string strfile[strings];
	
	size_t point=0;
	size_t last;
	int num = 0;
	while (point!=string::npos){
		last = point;
		point=file.find_first_of('\n',point+1);
		strfile[num]=file.substr(last+1,point-last-1);
		num++;
	}
	for (int i=0;i<strings;i++){
		cout<<strfile[i];
	}
}
