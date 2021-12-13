#include "code_gen.h"

void print_init()
{
    const char *formats[] = {
        "\"%d\\0A\\00\"",
        "\"%.08f\\0A\\00\"",
        "\"%s\\0A\\00\"",
    };
    const char *bools[] = {
        "\"false\\0A\\00\"",
        "\"true\\0A\\00\""};
    const char *attr1 = "private unnamed_addr constant";
    const char *attr2 = ", align 1";
    // formatting strings
    printf("@.str_int = %s [4 x i8] c%s%s\n", attr1, formats[0], attr2);
    printf("@.str_float = %s [7 x i8] c%s%s\n", attr1, formats[1], attr2);
    printf("@.str_string = %s [4 x i8] c%s%s\n", attr1, formats[2], attr2);
    // boolean values
    printf("@.false = %s [7 x i8] c%s%s\n", attr1, bools[0], attr2);
    printf("@.true = %s [6 x i8] c%s%s\n", attr1, bools[1], attr2);
    // printf
    printf("declare i32 @printf(i8*, ...) #1\n");
}

void generate_code(ast_ptr node)
{
    switch (node->node_type)
    {
    case Program:
        generate_code_program(node);
        break;
    case FuncDecl:
        generate_code_funcdecl(node);
        break;
    case VarDecl:
        generate_code_vardecl_local(node);
        break;
    default:
        for (int i = 0; i < node->children.size; i++)
        {
            ast_ptr ch = *(ast_ptr *)get(&node->children, i);
            generate_code(ch);
        }
        break;
    }
}

void generate_code_program(ast_ptr node)
{
    print_init();
    for (int i = 0; i < node->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&node->children, i);
        if (child->node_type == VarDecl)
            generate_code_vardecl_global(child);
        else
            generate_code(child);
    }
}

void generate_code_funcdecl(ast_ptr node)
{
    ast_ptr header = *(ast_ptr *)get(&node->children, 0);
    ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
    ast_ptr func_name = *(ast_ptr *)get(&header->children, 0);
    var_type v;
    if (header->children.size == 2)
        v = new_var_type_t(NONE_TP);
    else
    {
        ast_ptr tp = *(ast_ptr *)get(&header->children, 1);
        v = new_var_type(tp);
    }
    printf("declare %s @func.%s(", ll_type_str(v), func_name->str);
    for (int i = 0; i < params->children.size; i++)
    {
        ast_ptr p = *(ast_ptr *)get(&params->children, i);
        ast_ptr p_type = *(ast_ptr *)get(&p->children, 0);
        ast_ptr p_name = *(ast_ptr *)get(&p->children, 1);
        var_type t = new_var_type(p_type);
        printf("%s %%arg.%s", ll_type_str(t), p_name->str);
        if (i < params->children.size - 1)
            printf(", ");
    }
    printf(") {\n");
    ast_ptr body = *(ast_ptr *)get(&node->children, 1);
    generate_code(body);
    //! RETURN STATEMENT MISSING
    printf("}\n");
}

void generate_code_vardecl_local(ast_ptr node)
{
    ast_ptr tp = *(ast_ptr *)get(&node->children, 0);
    ast_ptr id = *(ast_ptr *)get(&node->children, 1);
    var_type v = new_var_type(tp);
    printf("%%%s = alloca %s\n", id->str, ll_type_str(v));
}

void generate_code_vardecl_global(ast_ptr node)
{
    ast_ptr tp = *(ast_ptr *)get(&node->children, 0);
    ast_ptr id = *(ast_ptr *)get(&node->children, 1);
    var_type v = new_var_type(tp);

    printf("@.%s = global %s %s\n", id->str, ll_type_str(v), zero(v));
}

char *ll_type_str(var_type type)
{
    if (!type.isVec)
        return (char *)ll_types[type.u.type]; // not a vector: simply return the address
    else
    {
        char *str = malloc(sizeof("()") + sizeof("double,") * type.u.vec.size);
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

char *zero(var_type v)
{
    return zeros[v.u.type == FLOAT32_TP];
}