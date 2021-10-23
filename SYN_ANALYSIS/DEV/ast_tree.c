#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct
{
    void *array;
    size_t size, capacity, el_size;
} vector;

typedef struct _node
{
    int node_type;
    char *str;
    vector children;
} ast_node;
typedef ast_node *ast_ptr;

vector new_vector(size_t size_elem)
{
    vector ans;
    ans.size = ans.capacity = 0;
    ans.el_size = size_elem;
    ans.array = NULL;
    return ans;
}

void push_back(vector *vec, void *elem)
{
    if (vec->size == 0)
    {
        // printf("Boopb1\n");
        void *new_vec = malloc(vec->el_size);
        vec->array = new_vec;
        memcpy(vec->array, elem, vec->el_size);
        // printf("Boopb2\n");
        vec->capacity = 1;
        vec->size++;
        // printf("Boopb3\n");
        return;
    }
    if (vec->size >= vec->capacity)
    {
        void *new_vec = realloc(vec->array, 2 * vec->capacity * vec->el_size);
        // memcpy(new_vec, vec->array, vec->el_size * vec->capacity);
        vec->capacity *= 2;
        // free(vec->array);
        vec->array = new_vec;
    }

    memcpy(vec->array + vec->size * vec->el_size, elem, vec->el_size);
    vec->size++;
    // free(elem); //! might be problematic if the thing is static
}

void *get(vector *vec, int pos)
{
    if (pos >= vec->size)
    {
        printf("Vec with no children...\n");
        return NULL;
    }
    return (char *)vec->array + vec->el_size * pos;
}

void pop_back(vector *vec)
{
    if (vec->size == 0)
        return;
    vec->size--;
    if (vec->size < vec->capacity / 4)
    {
        void *new_vec = realloc(vec->array, vec->el_size * vec->capacity / 2);
        vec->capacity /= 2;
    }
}

void test_vector()
{
    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    vector v = new_vector(sizeof(int));

    for (int x = 0; x < sizeof(a) / sizeof(int); x++)
        push_back(&v, &a[x]);

    for (int i = 0; i < v.size; i++)
    {
        printf("v[%d] = %d\n", i, (*(int *)get(&v, i)));
    }
    printf("%ld\n", v.capacity);
    for (int i = 0; i < 6; i++)
        pop_back(&v);
    for (int i = 0; i < v.size; i++)
    {
        printf("v[%d] = %d\n", i, (*(int *)get(&v, i)));
    }
    printf("%ld\n", v.capacity);
}

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

ast_node *new_node_ptr(int node_type, char *name)
{
    ast_node *ans = malloc(sizeof(ast_node));
    ans->node_type = node_type;
    int f = strlen(name) + 2;
    ans->str = malloc(f * sizeof(char));
    strcpy(ans->str, name);
    ans->children = new_vector(sizeof(ast_node *));
    return ans;
}

void add_child(ast_node *node, ast_node **child)
{
    push_back(&(node->children), /*(void *)(**/ child);
    // printf("Add Child1\n");
    ast_node **ch = (ast_node **)node->children.array + node->children.size - 1; // get(&(node->children), node->children.size - 1);
    // printf("Add Child2\n");
    // printf("Child: %s\n", (*child)->str);
    // printf("Child: %s\n", (*ch)->str);
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
    for (int i = 0; i < depth; i++)
        printf("..");
    printf("%s\n", node->str);
    for (int i = 0; i < node->children.size; i++)
    {
        print_ast_tree(*((ast_node **)get(&(node->children), i)), depth + 1);
    }
}

void ast_test()
{
    ast_ptr a = new_node_ptr(0, "Father"), b = new_node_ptr(0, "Child1"), c = new_node_ptr(0, "Child2");
    // ast_node *f = &a, *g = &b, *h = &c;
    add_child(a, &b);
    add_child(a, &c);
    print_ast_tree(a, 0);
    strcpy(b->str, "Heir?");
    print_ast_tree(a, 0);
}
/*
int main()
{
    ast_test();
    return 0;
}
*/