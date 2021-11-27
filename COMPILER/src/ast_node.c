#include "ast_node.h"

ast_node new_node(int node_type, char *name)
{
    ast_node ans;
    ans.node_type = node_type;
    int f = strlen(name) + 2;
    ans.str = malloc(f * sizeof(char));
    strcpy(ans.str, name);
    ans.children = new_vector(sizeof(ast_node *));
    return ans;
}

ast_node *new_node_ptr(int node_type, char *name, int line, int column)
{
    ast_node *ans = malloc(sizeof(ast_node));
    ans->node_type = node_type;
    int f = strlen(name) + 2;
    ans->str = malloc(f * sizeof(char));
    strcpy(ans->str, name);
    ans->children = new_vector(sizeof(ast_node *));
    ans->line = line;
    ans->column = column;
    return ans;
}

void add_child(ast_node *node, ast_node **child)
{
    push_back(&(node->children), /*(void *)(**/ child);
}

void remove_child(ast_node *node)
{
    pop_back(&(node->children));
}

void free_ast_ptr(ast_ptr node)
{
    free(node->children.array);
    free(node);
}

void print_ast_tree(ast_node *node, int depth)
{
    /*if (node == NULL || node->children.size == 0)
        return;*/
    //     if(depth>5) return;
    for (int i = 0; i < depth; i++)
        printf("..");
    /*switch (node->node_type)
    {
    case Id:
        printf("Id(%s)\n", node->str);
        break;
    case StrLit:
        printf("StrLit(%s)\n", node->str);
        break;
    case IntLit:
        printf("IntLit(%s)\n", node->str);
        break;
    case RealLit:
        printf("RealLit(%s)\n", node->str);
        break;
    default:*/
    printf("%s\n", node->str);
    // break;
    //}
    for (size_t i = 0; i < node->children.size; i++)
    {
        print_ast_tree(*((ast_node **)get(&(node->children), i)), depth + 1);
    }
}
