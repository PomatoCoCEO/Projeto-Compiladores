#include "str.h"
string new_string()
{
    string ans;
    ans.str = new_vector(sizeof(char)); //! not initialised!!
    return ans;
}

string add_strings(string a, string b)
{
    string ans = new_string();
    for (int i = 0; i < a.str.size - 1; i++) // a incluldes a terminating character
    {
        char c = *(char *)get(&(a.str), i);
        push_back(&(ans.str), &c);
    }

    for (int i = 0; i < b.str.size; i++) // includes the terminating character
    {
        char c = *(char *)get(&(b.str), i);
        push_back(&(ans.str), &c);
    }
    return ans;
}

void add_str(string *dest, string add)
{
    if (dest->str.size)
        pop_back(&(dest->str)); // taking '\0'
    for (int i = 0; i < add.str.size; i++)
    {
        push_back(&(dest->str), get(&(add.str), i));
    }
}

void add_str_ptr(string *dest, char *add)
{
    if (dest->str.size)
        pop_back(&(dest->str)); // taking '\0'
    for (int i = 0;; i++)
    {
        push_back(&(dest->str), &add[i]);
        if (!add[i])
            break;
    }
}

string new_str_range(char *beg, char *end) // based on a range
{
    string ans = new_string();
    for (char *c = beg; c != end; c++)
    {
        push_back(&(ans.str), c);
    }
    char s = '\0';
    push_back(&(ans.str), &s);
    return ans;
}

void add_char(string *a, char c) // it's like if it were passed by reference
{
    set(&(a->str), a->str.size - 1, &c);
    char z = '\0';
    push_back(&(a->str), &z);
}

string new_string_const(char str[])
{
    string a = new_string();
    for (char *c = str;; c++)
    {
        push_back(&(a.str), c);
        if (!*c)
            break;
    }
    return a;
}
void destroy_string(string a)
{
    free(a.str.array);
}
// print is the same as printf
int main()
{
    char *d = "wser";
    string s = new_string_const(d);
    printf("String: %s\n", (char *)s.str.array);
    char *f = "banana";
    string g = new_string_const(f);
    printf("String: %s\n", (char *)g.str.array);
    string sum = add_strings(s, g);
    printf("Sum: %s\n", (char *)sum.str.array);
    string r = new_str_range(f + 1, f + 4);
    printf("Range string: %s\n", (char *)r.str.array);
}