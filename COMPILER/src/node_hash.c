#include "node_hash.h"
#include <ctype.h>

char *name_decl(ast_ptr node)
{
    if (node->node_type == VarDecl || node->node_type == ParamDecl)
    {
        ast_ptr name = *(ast_ptr *)get(&node->children, 1);
        return name->str;
    }
    else if (node->node_type == FuncDecl)
    {
        ast_ptr header = *(ast_ptr *)get(&node->children, 0);
        ast_ptr name = *(ast_ptr *)get(&header->children, 0);

        char *args = malloc(strlen(name->str) + 11 * node->children.size);
        args[0] = 0;

        strcat(args, "(");
        ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
        for(int i = 0; i < params->children.size; i++) {
            ast_ptr paramdecl = *(ast_ptr *)get(&params->children, i);
            ast_ptr paramtype = *(ast_ptr *)get(&paramdecl->children, 0);
            char copy[strlen(paramtype->str) + 1];
            strcpy(copy, paramtype->str);
            copy[0] = tolower(copy[0]);
            strcat(args, copy);
            if (i < params->children.size - 1)
                strcat(args, ",");
        }
        strcat(args, ")");

        strcat(args, name->str);

        return name->str;
    }
    else if (node->node_type == Id)
    {
        return node->str;
    }
    assert(1 == 0);
}

size_t hash_ast_ptr(void *decl)
{
    ast_ptr node = (ast_ptr)decl;
    return hash_string(name_decl(node));
}

int equals_decl(void *node1, void *node2)
{
    ast_ptr n1 = (ast_ptr)node1;
    ast_ptr n2 = (ast_ptr)node2;

    if (strcmp(name_decl(n1), name_decl(n2)) == 0)
        return 1;
    return 0;
}