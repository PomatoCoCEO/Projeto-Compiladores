#include "semantic.h"

typedef struct table {
    char * name;
} table_t;

size_t hash_my_table(void * table) {
    return hash_string(((table_t *) table)->name);
}

void semantic(ast_ptr root) {
    hash_table main = new_hash_table();

    table_t table;
    strcpy(table.name, "Global");

    hashable program = new_hashable(&table, hash_my_table);

    printf("===== %s Symbol Table =====\n", table.name);

    insert(&main, &program);
}
