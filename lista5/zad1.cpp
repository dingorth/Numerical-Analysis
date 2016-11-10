#include <iostream>
#include <vector>

std::vector<double> Horner(std::vector<double> polynomial, double z)
{
	double alfa = polynomial[0];
	double beta = 0;
	double delta = 0;
	double gama = 0;

	for( int k = 1; k != polynomial.size(); k ++)
	{
		gama = delta + z*gama;
		delta = beta + z*delta;
		beta = alfa + z*beta;
		alfa = polynomial[k] + z*alfa;
	}

	std::vector<double> rtn = {alfa, beta, delta*2,gama*6};

	return rtn;
} 



int main() {

	std::vector<double> a = {2,1,1,1};

	std::vector<double> b = Horner(a,1);

	for( const auto &i : b )
		std::cout << i << " ";




	return 0;
}