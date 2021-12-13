#include "gen_code.h"

void gen_code(ast_ptr root) {
    for(size_t i = 0; i < root->children.size; i++) {
        ast_ptr child = *(ast_ptr *)get(&(root->children), i);
        if(child->node_type == VarDecl) {
            char * name = (*(ast_ptr *)get(&(child->children), 1))->str;
            printf("@var.%s = alloca i32\n", name);
        } else if(child->node_type == FuncDecl) {
            ast_ptr header = *(ast_ptr *)get(&(child->children), 0);
            char * name = (*(ast_ptr *)get(&(header->children), 0))->str;
            printf("define int32 @%s() {\n}\n", name);
        }
    }
}