#include "ast_node.h"

ast_node new_node(int node_type, char *name)
{
    ast_node ans;
    ans.node_type = node_type;
    int f = strlen(name) + 2;
    ans.str = malloc(f * sizeof(char));
    strcpy(ans.str, name);
    ans.children = new_vector(sizeof(ast_node *));
    ans.annotate = NULL;
    ans.uses = 0;
    ans.valid = 1;
    ans.code_gen_id = 0;
    ans.type = new_var_type_t(INVALID_TP);
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
    ans->annotate = NULL;
    ans->uses = 0;
    ans->valid = 1;
    ans->code_gen_id = 0;
    ans->type = new_var_type_t(INVALID_TP);
    push_back(&nodes_free, &ans);
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
    switch (node->node_type)
    {
    case Id:
        printf("Id(%s)", node->str);
        break;
    case StrLit:
        printf("StrLit(%s)", node->str);
        break;
    case IntLit:
        printf("IntLit(%s)", node->str);
        break;
    case RealLit:
        printf("RealLit(%s)", node->str);
        break;
    case And:
        printf("And");
        break;
    case Assign:
        printf("Assign");
        break;
    case Div:
        printf("Div");
        break;
    case Eq:
        printf("Eq");
        break;
    case Ge:
        printf("Ge");
        break;
    case Gt:
        printf("Gt");
        break;
    case Le:
        printf("Le");
        break;
    case Minus:
        printf("Minus");
        break;
    case Or:
        printf("Or");
        break;
    case Ne:
        printf("Ne");
        break;
    case Lt:
        printf("Lt");
        break;
    case Add:
        printf("Add");
        break;
    case Sub:
        printf("Sub");
        break;
    case Mul:
        printf("Mul");
        break;
    case Mod:
        printf("Mod");
        break;
    case Not:
        printf("Not");
        break;
    case Plus:
        printf("Plus");
        break;
    case ParseArgs:
        printf("ParseArgs");
        break;
    case Print:
        printf("Print");
        break;
    default:
        printf("%s", node->str);
        break;
    }
    if (node->annotate != NULL && !(node->node_type == Call && strcmp(node->annotate, "none") == 0))
        printf(" - %s", node->annotate);
    printf("\n");
    for (size_t i = 0; i < node->children.size; i++)
    {
        print_ast_tree(*((ast_node **)get(&(node->children), i)), depth + 1);
    }
}
