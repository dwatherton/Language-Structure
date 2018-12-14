#include<iostream>
#include<iomanip>
#include<fstream>
#include<string>
#include<cctype>
#include<stack>

using namespace std;

void parse(string input);

int main()
{
	string fileName = "data.txt", input;
	ifstream fin(fileName);
	char letter = 'a';
	
	// Verify file is open and filestream is ready
	if (!fin.is_open() || fin.fail())
	{
		cout << "Error opening file " << fileName << "!" << endl;
		cout << "Returned exit code 1." << endl;
		system("pause");
		return 1;
	}

	while (!fin.eof())
	{
		// Read until end of file
		fin >> input;
		// Pretty print the line to be parsed
		cout << "(" << letter << "). " << left << setw(15) << input << " = ";
		// Parse the string read from file
		parse(input);
		letter++;
	}
	
	// Close the file
	fin.close();
	system("pause");
	return 0;
}

void parse(string input)
{
	stack<int> stack;
	int a, b;

	// Parse the line (left to right)
	for (int i = 0; i < input.size(); i++)
	{
		// Check for an operand (0 - 9)
		if (isdigit(input.at(i)))
		{
			// Push the digit onto the stack (subtracting '0' to convert char to it's respective int)
			stack.push(input.at(i) - '0');
		}
		// Check for an operator (+, -, *, /)
		else if (input.at(i) == '+' || input.at(i) == '-' || input.at(i) == '*' || input.at(i) == '/')
		{
			// Make sure there are at LEAST two operands on stack
			if (stack.size() >= 2)
			{
				a = stack.top();
				stack.pop();
				b = stack.top();
				stack.pop();

				// Handle the operator cases
				switch (input.at(i))
				{
					case '+':
					{
						stack.push(b + a);
						break;
					}
					case '-':
					{
						stack.push(b - a);
						break;
					}
					case '*':
					{
						stack.push(b * a);
						break;
					}
					case '/':
					{
						stack.push(b / a);
						break;
					}
				}
			}
			// Invalid, too many operators
			else
			{
				cout << "Error, Too Many Operators! The offending operator was '" << input.at(i) << "'!" << endl;
				return;
			}
		}
		// Invalid, Neither an operand nor an operator
		else
		{
			cout << "Error, the character at input[" << i << "] is neither an operator nor an operand!" << endl;
			return;
		}
	}// For

	// Make sure there is only the result left on the stack post parse
	if (stack.size() == 1)
	{
		cout << stack.top() << endl;
	}
	// Invalid, too many operands
	else
	{
		cout << "Error, Too Many Operands!" << endl;
	}
	return;
}