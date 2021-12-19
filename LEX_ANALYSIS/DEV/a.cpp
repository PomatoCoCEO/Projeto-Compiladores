#include <iostream>
using namespace std;

int main()
{
    cout << "typedef enum tok_type {";
    string a;
    bool first = false;
    while (getline(cin, a))
    {
        cout << (first ? ",\n" : "") << a << "_T";
        first = true;
    }
    cout << "};\n";
}