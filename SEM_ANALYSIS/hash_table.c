#include "../STRUCT/vector.c"
#include<stdio.h>
#include<string.h>

#define MOD (1000000007)
typedef struct {
    size_t hash;
    void* object;
} hashable;
typedef struct {
    vector vec;
    size_t size;
    size_t vec_size;
    size_t vec_size_pos;
} hash_table;

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

size_t hash_int(int a) {
    return a%MOD;
}

int comp_int(void* a, void*b) {
    int c = *(int*) a;
    int d = *(int*) b;
    return c == d;
}

hashable hashable_int(int* g) {
    hashable ans;
    ans.object = g;
    ans.hash = hash_int(*g);
    // printf("Hashable_int---\n");
    return ans;
}

size_t hash_string(char* str) {
    size_t p = 257, ans = 0;
    for(int i = 0; str[i]; i++) {
        ans *= p;
        ans += str[i];
    }
    return ans;
}

int comp_string(void* a, void* b) {
    char* c=(char*)a;
    char*d = (char*)d;
    if(!c || !d) return 0;
    return strcmp(c,d);
}

hashable hashable_string(char* str) {
    hashable ans;
    ans.hash = hash_string(str);
    ans.object = str;
}

int main() {
    int g[] = {1,2,3,4,5,6,7,8,9};
    hash_table ht = new_hash_table();
    for(int i = 0; i<(sizeof(g)/sizeof(int)); i++) {
        hashable h = hashable_int(&g[i]);
        insert(&ht, &h);
    }
    for(int i = 0; i<(sizeof(g)/sizeof(int)); i++) {
        hashable h = hashable_int(&g[i]);
        printf("%d\n", contains(&ht, &h, comp_int));
    }
    int k=1000;
    hashable j = hashable_int(&k);
    printf("%d\n", contains(&ht, &j, comp_int));
    return 0;
}