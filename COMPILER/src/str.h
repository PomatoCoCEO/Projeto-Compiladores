#ifndef STR_H
#define STR_H
#include "vector.h"
#include <stdlib.h>
typedef struct
{
    vector str;
} string;

string new_string(); //! WARNING: STRING NOT INITIALIZED TO ""

string add(string a, string b);
string new_str_range(char *beg, char *end);

void add_char(string *a, char c);
void add_str(string *dest, string add);
void add_str_ptr(string *dest, char *add);
string new_string_const(char str[]);

void destroy_string(string a);

// print is the same as printf

#endif