#include "hash_table.h"

int nos[]={5,11,23,47,97,197,397,797,1597,3203,6421,12853,25717,51437,102877};

hash_table new_hash_table() {
    hash_table ans;
    ans.size=0;
    ans.vec_size_pos = 0;
    ans.vec_size = nos[ans.vec_size_pos];
    ans.vec = new_vector(sizeof(vector));
    for(int i = 0; i<5; i++) {
        vector v = new_vector(sizeof(hashable));
        push_back(&(ans.vec), &v); // vamos supor que temos tamanho de 5
    }
    // printf("Here..\n");
    return ans;
}

void insert(hash_table* ht, hashable* elem) {
    size_t pos = elem->hash % ht->vec_size;
    // printf("pos=%ld, size=%ld\n", pos, ht->vec.size);
    vector* v = get(&(ht->vec), pos);
    // printf("boo\n");
    push_back(v, elem);
    ht->size++;
    if(ht->size >= ht->vec_size/2 && ht->vec_size_pos < 14) { // reallocate
        vector new_vec = new_vector(sizeof(vector));
        for(int i = 0; i<nos[ht->vec_size_pos+1]; i++) {
            vector v = new_vector(sizeof(hashable));
            push_back(&new_vec, &v);
        }
        for(int i = 0; i<ht->vec_size; i++) {
            vector* v = get(&(ht->vec), i);
            for(int j = 0; j<v->size; j++) {
                hashable* h = get(v,j);
                size_t hash = h->hash;
                vector* nvec = get(&new_vec, hash % nos[ht->vec_size_pos+1]);
                push_back(nvec, h);
            }
            free(v->array);
        }
        free(ht->vec.array);
        ht->vec = new_vec;
        ht->vec_size_pos++;
        ht->vec_size = nos[ht->vec_size_pos];
    }
}

int contains(hash_table* h, hashable* d, int (*comp)(void*, void*)) {
    int pos = d->hash % h->vec_size;
    vector* v = get(&(h->vec), pos);
    for(int i = 0; i<v->size; i++) {
        hashable* o = get(v, i);
        if(comp(o->object, d->object)) return 1;
    }
    return 0;
}

size_t hash_int(void* a) {
    return (*(int*)a)%HASH_MOD;
}

int comp_int(void* a, void*b) {
    int c = *(int*) a;
    int d = *(int*) b;
    return c == d;
}

hashable new_hashable(void* object, size_t(*hash)(void*)) {
    size_t h = hash(object);
    hashable ans;
    ans.object = object;
    ans.hash = h;
    return ans;
}

/*
hashable hashable_int(void* g) {
    hashable ans;
    ans.object = g;
    ans.hash = hash_int(*(int*)g);
    // printf("Hashable_int---\n");
    return ans;
}*/

size_t hash_string(void* st) {
    char* str = (char*) st;
    size_t p = 257, ans = 0;
    for(int i = 0; str[i]; i++) {
        ans = (ans*p)%HASH_MOD;
    }
    return ans;
}

int comp_string(void* a, void* b) {
    char* c=(char*)a;
    char*d = (char*)d;
    if(!c || !d) return 0;
    return strcmp(c,d);
}

/*hashable hashable_string(char* str) {
    hashable ans;
    ans.hash = hash_string(str);
    ans.object = str;
    return ans;
}*/
