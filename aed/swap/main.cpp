#include <iostream>

using namespace std;

void swap(int *a, int *b)
{
	int temp = *b;
	*b = *a;
	*a = temp;
	return;
}


int main()
{
	int a = 1, b = 2;
	
	cout << a << "\n";
	cout << &a << "\n";
	
	/*pointer to the address of the variable in memory*/
	int *address_a = &a, *address_b = &b; 
	
	swap(address_a, address_b);
	
	cout << a << " " << address_a << "\n";
	cout << b << " " << address_b << "\n";
}
