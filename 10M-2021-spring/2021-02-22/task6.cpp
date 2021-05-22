#include <iostream>
#include <regex>

int main()
{
	std::string c;
	std::regex rg ("((([1-9]?[0-9])|(1[0-9][0-9])|(2[0-4][0-9])|(25[0-5]))\\.){4}$");
	std::getline (std::cin,c);
	c.push_back('.');
	if (std::regex_match(c,rg))
	{
		c.pop_back();
		std::cout << "String \"" << c <<"\" is a valid ip adress\n";
	}
	else
	{
		c.pop_back();
		std::cout << "String \"" << c << "\" is not a valid ip adress\n";
	}
}
