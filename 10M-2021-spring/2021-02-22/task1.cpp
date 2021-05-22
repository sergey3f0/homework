#include <iostream>
#include <regex>

int main()
{
	std::string s;
	std::regex rg ("[2-7][0-9]$");
	std::getline (std::cin,s);
	if (std::regex_match(s,rg))
	{
		std::cout << "String \"" << s <<"\" is a number in range 20-79\n";
	}
	else
	{
		std::cout << "String \"" << s << "\" is not a number in range 20-79\n";
	}
}
