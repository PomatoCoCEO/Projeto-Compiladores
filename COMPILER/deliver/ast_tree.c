#include "ast_tree.h"

vector stack;

void push_node(int node_type, char *format, char *val, int line, int column)
{
    char *name;
    if (node_type == IntLit || node_type == RealLit || node_type == StrLit || node_type == Id)
    {
        name = malloc(strlen(format) + strlen(val) + 2);
        sprintf(name, format, val);
    }
    else
    {
        name = malloc(strlen(format) + 2);
        strcpy(name, format);
    }
    ast_ptr n = new_node_ptr(node_type, name, line, column);
    push_back(&stack, &n);
    free(name);
}

void push_with_children(int node_type, char *name, int no_children, int line, int column)
{
    ast_ptr n = new_node_ptr(node_type, name, line, column);
    for (size_t i = stack.size - no_children; i < stack.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&stack, i);
        add_child(n, &ch);
    }
    for (int i = 0; i < no_children; i++)
        pop_back(&stack);

    push_back(&stack, &n);
}

ast_ptr pop_node()
{
    ast_ptr *ans = get(&stack, stack.size - 1);
    if (ans == NULL)
    {
        fprintf(stderr, "No values in stack!\n");
        exit(-1);
    }
    pop_back(&stack);
    return *ans;
}

void print_top()
{
    printf("Top:");
    ast_ptr *ans = get(&stack, stack.size - 1);
    print_ast_tree(*ans, 0);
}

void handle_rep(int node_type, char *name, int no_children, int reverse, int line, int column)
{
    ast_ptr n = pop_node(), aid = n;
    vector nodes = new_vector(sizeof(ast_ptr));
    vector to_free = new_vector(sizeof(ast_ptr));
    push_back(&to_free, &aid);
    while ((int)aid->children.size > no_children)
    {
        if (!reverse)
        {
            for (int j = 0; j < no_children; j++)
            {
                ast_ptr st_node = (*(ast_ptr *)get(&(aid->children), j));
                push_back(&nodes, &st_node);
            }
        }
        else
        {
            for (int j = no_children - 1; j > 0; j--)
            {
                ast_ptr st_node = (*(ast_ptr *)get(&(aid->children), j));
                push_back(&nodes, &st_node);
            }
        }
        aid = (*(ast_ptr *)get(&(aid->children), no_children));
        push_back(&to_free, &aid);
    }
    if (nodes.size > 1 /*no_children*/)
    {
        ast_ptr block_node = new_node_ptr(node_type, name, line, column);
        for (size_t i = 0; i < nodes.size; i++)
        {
            push_back(&(block_node->children), get(&nodes, i));
        }
        push_back(&stack, &block_node);
    }
    if (nodes.size == 1)
        push_back(&stack, get(&nodes, 0));
    for (size_t i = 0; i < to_free.size; i++)
    {
        free_ast_ptr((*(ast_ptr *)get(&to_free, i)));
    }
    free(nodes.array);
    free(to_free.array);
}

vector flat_children(ast_ptr node, int children, int reverse)
{
    vector ans = new_vector(sizeof(ast_ptr));
    vector to_free = new_vector(sizeof(ast_ptr));
    ast_ptr cur = node;
    push_back(&to_free, &cur);
    while (cur->children.size > (size_t)children)
    {
        if (!reverse)
        {
            for (int i = 0; i < children; i++)
            {
                push_back(&ans, get(&(cur->children), i));
            }
        }
        else
        {
            for (int i = children - 1; i >= 0; i--)
            {
                push_back(&ans, get(&(cur->children), i));
            }
        }
        cur = *(ast_ptr *)get(&(cur->children), children);
        /*    RS
            /\ \  -> children 2
            S T RS
            /\
            S RS*/
        push_back(&to_free, &cur);
    }
    for (size_t i = 0; i < to_free.size; i++)
    {
        free_ast_ptr(*(ast_ptr *)get(&to_free, i));
    }
    free(to_free.array);
    return ans;
}

void handle_blocks(ast_ptr node)
{
    int t = node->node_type;
    for (size_t i = 0; i < node->children.size; i++)
    {
        handle_blocks(*(ast_ptr *)get(&(node->children), i));
    }
    if (t != If && t != For)
    {
        vector to_eliminate = new_vector(sizeof(int));
        for (size_t i = 0; i < node->children.size; i++)
        {
            ast_ptr ch = *(ast_ptr *)get(&(node->children), i);
            if (ch->node_type == Block)
            {
                if (ch->children.size == 1)
                {
                    ast_ptr grandson = *(ast_ptr *)get(&(ch->children), 0);
                    set(&(node->children), i, &grandson);
                    free_ast_ptr(ch);
                    ch = grandson;
                }
                else if (ch->children.size == 0)
                {
                    push_back(&to_eliminate, &i);
                }
            }
        }
        push_back(&to_eliminate, &(node->children.size));
        if (to_eliminate.size > 0)
        {
            vector new_children = new_vector(sizeof(ast_ptr));
            int pos1 = *(int *)get(&to_eliminate, 0), pos_aid = 0;
            for (int i = 0; i < (int)node->children.size; i++)
            {
                if (i == pos1)
                {
                    free_ast_ptr(*(ast_ptr *)get(&(node->children), i));
                    pos_aid++;
                    pos1 = *(int *)get(&to_eliminate, pos_aid);
                    continue;
                }
                else
                {
                    push_back(&new_children, get(&(node->children), i));
                }
            }
            free(node->children.array);
            node->children = new_children;
        }
    }
}
