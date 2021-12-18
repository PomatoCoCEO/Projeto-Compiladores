#include "vector.h"

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
    if (vec->capacity == 0)
    {
        void *new_vec = malloc(vec->el_size);
        vec->array = new_vec;
        memcpy(vec->array, elem, vec->el_size);
        vec->capacity = 1;
        vec->size++;
        return;
    }
    if (vec->size >= vec->capacity)
    {
        void *new_vec = realloc(vec->array, 2 * vec->capacity * vec->el_size);
        vec->capacity *= 2;
        vec->array = new_vec;
    }

    memcpy(vec->array + vec->size * vec->el_size, elem, vec->el_size);
    vec->size++;
}

void *get(vector *vec, int pos)
{
    if (pos >= (int)vec->size)
    {
        printf("Vec with no children...\n");
        return NULL;
    }
    return (char *)vec->array + vec->el_size * pos;
}

void set(vector *vec, size_t pos, void *val)
{
    if (vec->size <= pos || pos < 0)
    {
        fprintf(stderr, "Invalid set in vector\n");
        exit(0);
    }
    memcpy(vec->array + vec->el_size * pos, val, vec->el_size);
}

void pop_back(vector *vec)
{
    if (vec->size == 0)
        return;
    vec->size--;
    if (vec->size < vec->capacity / 4)
    {
        vec->array /*void *r*/ = realloc(vec->array, vec->el_size * vec->capacity / 2);
        vec->capacity /= 2;
    }
}

void test_vector()
{
    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    vector v = new_vector(sizeof(int));

    for (int x = 0; x < (int)(sizeof(a) / sizeof(int)); x++)
        push_back(&v, &a[x]);

    for (int i = 0; i < (int)v.size; i++)
    {
        printf("v[%d] = %d\n", i, (*(int *)get(&v, i)));
    }
    printf("%ld\n", v.capacity);
    for (int i = 0; i < 6; i++)
        pop_back(&v);
    for (int i = 0; i < (int)v.size; i++)
    {
        printf("v[%d] = %d\n", i, (*(int *)get(&v, i)));
    }
    printf("%ld\n", v.capacity);
}
