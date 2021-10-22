#include <stdio.h>
#include <stdlib.h>
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

vector new_vector(size_t size_elem)
{
    vector ans;
    ans.size = ans.capacity = 0;
    ans.el_size = size_elem;
}

void push_back(vector *vec, void *elem)
{
    if (vec->size == 0)
    {
        void *new_vec = malloc(vec->el_size);
        vec->array = new_vec;
        memcpy(vec->array, elem, vec->el_size);
        // vec->size = 1;
        vec->capacity = 1;
    }
    else if (vec->size >= vec->capacity)
    {
        void *new_vec = malloc(2 * vec->capacity * vec->el_size);
        memcpy(new_vec, vec->array, vec->el_size * vec->capacity);
        vec->capacity *= 2;
        free(vec->array);
        vec->array = new_vec;
    }
    memcpy(vec->array + vec->size * vec->el_size, elem, vec->el_size);
    vec->size++;
    free(elem);
}

void *get(vector *vec, int pos)
{
    if (pos >= vec->size)
        return NULL;
    return (char *)vec->array + vec->el_size * pos;
}