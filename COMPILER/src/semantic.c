#include "semantic.h"
#include "str.h"
#include "var_types.h"
typedef struct table
{
    char *name;
} table_t;

size_t hash_my_table(void *table)
{
    return hash_string(((table_t *)table)->name);
}

const char *type_str(ast_node_type type)
{
    switch (type)
    {
    case Int:
        /* code */
        return var_types[0];
    case Float32:
        return var_types[1];
    case String:
        return var_types[2];
    case Bool:
        return var_types[3];
    default:
        return ""; // no association
    }
}

string table_entry_funcdecl(ast_ptr func_decl)
{
    ast_ptr header = *(ast_ptr *)get(&(func_decl->children), 0);
    ast_ptr id = *(ast_ptr *)get(&(header->children), 0);
    string ans = new_str_range(id->str + 2, id->str + strlen(id->str) - 1);
    add_char(&ans, '\t'); // name handled
    add_char(&ans, '(');
    ast_ptr params = *(ast_ptr *)get(&(header->children), header->children.size - 1); // parameters are the last
    for (int i = 0; i < params->children.size; i++)
    {
        if (i > 0)
        {
            char *sep = ", ";
            add_str_ptr(&ans, sep);
        }
        ast_ptr decl = *(ast_ptr *)get(&(params->children), i);
        ast_ptr type = *(ast_ptr *)get(&(decl->children), 0);
        add_str_ptr(&ans, type_str(type->node_type));
    }
    add_char(&ans, ')');
    add_char(&ans, '\t'); // parameters handled
    if (header->children.size == 2)
        add_str_ptr(&ans, "none"); // no return type
    else
    {
        ast_ptr type = *(ast_ptr *)get(&(header->children), 1);
        add_str_ptr(&ans, type_str(type->node_type)); // appends return type
    }

    return ans;
}

string table_entry_vardecl(ast_ptr var_decl)
{
    ast_ptr type = *(ast_ptr *)get(&(var_decl->children), 0);
    ast_ptr id = *(ast_ptr *)get(&(var_decl->children), 1);
    char *name = id->str;
    string ans = new_str_range(name + 2, name + strlen(name) - 1);
    char *app = "\t\t";
    add_str_ptr(&ans, app);
    add_str_ptr(&ans, type_str(type->node_type));
}

/*
string table_entry(ast_ptr func_decl)
{
    string ans = new_string_const("(");
    ast_ptr params = *(ast_ptr *)get(&(func_decl->children), 1);
    for (int i = 0; i < params->children.size; i++)
    {
        if (i > 0)
        {
            char *sep = ", ";
            add_str_ptr(&ans, sep);
        }
        ast_ptr decl = *(ast_ptr *)get(&(params->children), i);
        ast_ptr type = *(ast_ptr *)get(&(decl->children), 0);
        add_str_ptr(&ans, type_str(type->node_type));
    }
    add_char(&ans, ')');
    return ans;
}*/

void semantic(ast_ptr root)
{
    hash_table main = new_hash_table();

    table_t table;
    strcpy(table.name, "Global");

    hashable program = new_hashable(&table, hash_my_table);

    printf("===== %s Symbol Table =====\n", table.name);

    insert(&main, &program);
}

void print_table(ast_ptr a)
{
    if (a->node_type == Program)
    {
        printf("===== Global Symbol Table =====\n");
        for (int i = 0; i < a->children.size; i++)
        {
            ast_ptr ch = *(ast_ptr *)get(&(a->children), i);
            string entry;
            if (ch->node_type == FuncDecl)
            {
                entry = table_entry_funcdecl(ch);
            }
            else if (ch->node_type == VarDecl)
            {
                entry = table_entry_vardecl(ch);
            }
            printf("%s\n", (char *)entry.str.array);
            destroy_string(entry);
        }
    }
    else if (a->node_type == FuncDecl)
    {
    }
}