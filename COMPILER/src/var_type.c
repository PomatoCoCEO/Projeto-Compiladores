#include "ast_node.h"
#include "var_str.h"
var_type new_var_type(ast_ptr node)
{
    var_type a, v;
    ast_ptr type, header, decl;
    switch (node->node_type)
    {
    case IntLit:
    case Int:
        a.isVec = 0;
        a.u.type = INT_TP;
        break;
    case RealLit:
    case Float32:
        a.isVec = 0;
        a.u.type = FLOAT32_TP;
        break;
    case StrLit:
    case String:
        a.isVec = 0;
        a.u.type = STRING_TP;
        break;
    case Bool:
        a.isVec = 0;
        a.u.type = BOOL_TP;
        break;
    case VarDecl:
    case ParamDecl:
        type = *(ast_ptr *)get(&node->children, 0);
        a = new_var_type(type);
        break;
    case FuncDecl:
        header = *(ast_ptr *)get(&node->children, 0);
        if (header->children.size == 2)
        {
            a.isVec = 0;
            a.u.type = NONE_TP;
            break;
        }
        else
        {
            type = *(ast_ptr *)get(&header->children, 1);
            a = new_var_type(type);
            break;
        }
    case FuncParams:
        a.isVec = 1;
        a.u.vec = new_vector(sizeof(int));
        for (int i = 0; i < node->children.size; i++)
        {
            decl = *(ast_ptr *)get(&node->children, i);
            v = new_var_type(decl);
            push_back(&(a.u.vec), &(v.u.type));
        }
        break;
    default:
        a.isVec = 0;
        a.u.type = INVALID_TP;
    }
    return a;
}

var_type new_var_type_t(int type)
{
    var_type a;
    a.isVec = 0;
    a.u.type = type;
    return a;
}

var_type copy_var_type_t(var_type type)
{
    var_type a;
    a.isVec = type.isVec;
    if (!type.isVec)
    {
        a.u.type = type.u.type;
        return a;
    }
    a.u.vec = new_vector(sizeof(int));
    for (int i = 0; i < type.u.vec.size; i++)
    {
        int t = *(int *)get(&(type.u.vec), i);
        push_back(&(a.u.vec), &t);
    }
    return a;
}

int equals_var_type(void *a, void *b)
{
    var_type c = *(var_type *)a;
    var_type d = *(var_type *)b;

    if (c.isVec != d.isVec) // different kind of representation
        return 0;
    if (!c.isVec)
        return c.u.type == d.u.type;
    if (c.u.vec.size != d.u.vec.size) // different vector sizes
        return 0;

    for (int i = 0; i < c.u.vec.size; i++) // comparison element by element, vectors of the same size
    {
        // printf("Comp1\n");
        int el1 = *(int *)get(&(c.u.vec), i);
        // printf("Comp1\n");
        int el2 = *(int *)get(&(d.u.vec), i);
        // printf("Comp1\n");
        if (el1 != el2)
            return 0;
    }
    return 1;
}

int equals_var_int(var_type a, int b)
{
    return a.isVec == 0 && a.u.type == b;
}

char *var_type_str(var_type type)
{
    if (!type.isVec)
        return (char *)var_type_strings[type.u.type]; // not a vector: simply return the address
    else
    {
        char *str = malloc(sizeof("()") + sizeof("float32") * type.u.vec.size);
        str[0] = '\0'; // it's a vector of function parameters: build the string
        strcat(str, "(");
        for (int i = 0; i < type.u.vec.size; i++)
        {
            int t = *(int *)get(&(type.u.vec), i);
            strcat(str, var_type_strings[t]);
            if (i != type.u.vec.size - 1)
                strcat(str, ",");
        }
        strcat(str, ")");
        return str;
    }
}
