#ifndef VECTOR_H
#define VECTOR_H
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
typedef struct
{
    void *array;
    size_t size, capacity, el_size;
} vector;

vector new_vector(size_t size_elem);

void push_back(vector *vec, void *elem);

void *get(vector *vec, int pos);

void set(vector *vec, size_t pos, void *val);

void pop_back(vector *vec);
void test_vector();

#endif
