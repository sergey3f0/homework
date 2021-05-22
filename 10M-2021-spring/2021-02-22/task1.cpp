#include <iostream>
#include <regex>

int main()
{
	std::string s;
	std::regex rg ("[2-7][02468]$");
	std::getline (std::cin,s);
	if (std::regex_match(s,rg))
	{
		std::cout << "String \"" << s <<"\" is an even number in range 20-79\n";
	}
	else
	{
		std::cout << "String \"" << s << "\" is not an even number in range 20-79\n";
	}
}
