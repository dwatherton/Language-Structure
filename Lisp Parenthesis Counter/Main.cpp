#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int menu();
string updatePath();
void checkFile(string path);

int main()
{
	int choice = 0;
	string path;

	do {
		system("cls");
		choice = menu();

		switch (choice)
		{
			// Update Path
			case 1:
			{
				path = updatePath();
				break;
			}
			// Check File
			case 2:
			{
				checkFile(path);
				break;
			}
			// Quit
			case 3:
			{
				system("exit");
				break;
			}
			default:
			{
				cout << "Error! Please enter a number 1 - 3..." << endl << endl;
				system("pause");
				break;
			}
		}
	} while (choice != 3);

	system("pause");
	return 0;
}

int menu()
{
	int choice;
	cout << "\t\t Welcome to the LISP Parenthesis Counter Program!" << endl << endl;
	cout << "\t\t\t  1. Update path to file" << endl;
	cout << "\t\t\t  2. Check the file" << endl;
	cout << "\t\t\t  3. Quit" << endl;
	cout << endl << "Enter your choice here => ";
	cin >> choice;
	cout << endl;
	return choice;
}

string updatePath()
{
	string path, fileName;

	// Get the new file name
	cout << "Enter the LISP file to check here: => ";
	cin >> fileName;

	// Check if the user drag-n-droped the file
	if (fileName.length() >= 30)
	{
		path = fileName;
	}
	else
	{
		path = "C:\\Users\\Danny\\Desktop\\LISP\\Source\\";
		// Add the file name and extension to the path
		path.append(fileName).append(".lisp");
	}

	// Alert the user that the file name and path has been updated
	cout << endl << "The file name and path has been successfully updated!";
	cout << endl << "The file to be opened is: " << path << "." << endl << endl;

	system("pause");
	return path;
}

void checkFile(string path)
{
	fstream fin;
	string lispCode;
	int lineNum = 0, count = 0;

	// Check that the user has set a path to a file
	if (path.length() == 0)
	{
		cout << "Please enter a path to the file to check..." << endl << endl;
		system("pause");
		return;
	}

	// Open the file
	fin.open(path);

	// Verify file is open and filestream is ready
	if (!fin.is_open() || fin.fail())
	{
		cout << "Error opening file at path: '" << path << "'!" << endl << endl;
		system("pause");
		return;
	}

	// Column Headers
	cout << "Count  #" << "  Line #" << "   Lisp Code" << endl;

	// Loop through the file
	while (!fin.eof())
	{
		// Get the lisp code line by line
		getline(fin, lispCode);
		lineNum++;

		// Add 1 for each opening parenthesis, subtract 1 for each closing parenthesis
		for (int i = 0; i < lispCode.size(); i++)
		{
			if (lispCode.at(i) == '(')
			{
				count++;
			}
			else if (lispCode.at(i) == ')')
			{
				count--;
			}
		}

		// Display the count for each line along with the lisp code
		cout << "Count: " << count << "  " << "Line " << lineNum << ":  " << lispCode << endl;
	}

	// Output how I am doing on parenthesis
	if (count < 0)
	{
		cout << endl << "You have too many closing parenthesis!" << endl << endl;
	}
	else if (count > 0)
	{
		cout << endl << "You have too many opening parenthesis!" << endl << endl;
	}
	else
	{
		cout << endl << "You have the correct number of parenthesis!" << endl << endl;
	}

	system("pause");
	return;
}