#include <iostream>
#include <regex>

int main()
{
	std::string s;
	std::regex nrg ("-?\\.$");
	std::regex rg ("-?(([1-9][0-9]*)|0)?\\.(([0-9]*[1-9])|0)?$");
	std::getline (std::cin,s);

	if ((std::regex_match(s,rg)) &! (std::regex_match(s,nrg)))
	{
		std::cout << "String \"" << s <<"\" is a valid floating-point number\n";
	}
	else
	{
		std::cout << "String \"" << s << "\" is not a valid floating-point number\n";
	}
}
