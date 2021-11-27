#include "semantic.h"

vector stack_tables; // to be constructed as new_vector(sizeof(hash_table)) stores the hash tables in execution time
vector vec_tables;

void print_st_program(hash_table *h)
{
    printf("===== Global Symbol Table =====\n");
    vector nds = nodes(h);
    for (int i = 0; i < nds.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&nds, i);
        print_entry(ch);
    }
    printf("\n");
    for (int i = 0; i < vec_tables.size; i++)
        print_st_funcdecl(get(&vec_tables, i));
}

void print_st_funcdecl(hash_table *fd)
{
    ast_ptr funcdecl = fd->ref;
    ast_ptr header = *(ast_ptr *)get(&funcdecl->children, 0);
    ast_ptr id = *(ast_ptr *)get(&header->children, 0);
    printf("===== Function %s(", id->str);
    ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
    for (int i = 0; i < params->children.size; i++)
    {
        ast_ptr paramdecl = *(ast_ptr *)get(&params->children, i);
        ast_ptr paramtype = *(ast_ptr *)get(&paramdecl->children, 0);
        paramtype->str[0] = tolower(paramtype->str[0]);
        printf("%s", paramtype->str);
        if (i < params->children.size - 1)
            printf(",");
    }
    printf(") Symbol Table =====\n");

    if (header->children.size == 2)
        printf("return\t\tnone\n");
    else
    {
        ast_ptr ret_type = *(ast_ptr *)get(&header->children, 1);
        ret_type->str[0] = tolower(ret_type->str[0]);
        printf("return\t\t%s\n", ret_type->str);
    }
    vector nds = nodes(fd);
    for (int i = 0; i < nds.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&nds, i);
        print_entry(ch);
    }
    printf("\n");
}

void print_entry(ast_ptr decl)
{
    if (decl->node_type == VarDecl)
    {
        ast_ptr decl_type = *(ast_ptr *)get(&decl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&decl->children, 0);
        decl_type->str[0] = tolower(decl_type->str[0]);
        printf("%s\t\t%s\n", id->str, decl_type->str);
    }
    if (decl->node_type == ParamDecl)
    {
        ast_ptr decl_type = *(ast_ptr *)get(&decl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&decl->children, 0);
        decl_type->str[0] = tolower(decl_type->str[0]);
        printf("%s\t\t%s\tparam\n", id->str, decl_type->str);
    }
    if (decl->node_type == FuncDecl)
    {
        ast_ptr header = *(ast_ptr *)get(&decl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&header->children, 0);
        printf("%s\t(", id->str);
        ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
        for (int i = 0; i < params->children.size; i++)
        {
            ast_ptr paramdecl = *(ast_ptr *)get(&params->children, i);
            ast_ptr paramtype = *(ast_ptr *)get(&paramdecl->children, 0);
            paramtype->str[0] = tolower(paramtype->str[0]);
            printf("%s", paramtype->str);
            if (i < params->children.size - 1)
                printf(",");
        }
        printf(")\t");
        if (header->children.size == 2)
            printf("none\n");
        else
        {
            ast_ptr ret_type = *(ast_ptr *)get(&header->children, 1);
            ret_type->str[0] = tolower(ret_type->str[0]);
            printf("%s\n", ret_type->str);
        }
    }
}

vector nodes(hash_table *h)
{
    vector ans = new_vector(sizeof(ast_ptr));

    ast_ptr dummy = new_node_ptr(0, "Dummy", 0, 0);

    for (int i = 0; i < h->size; i++)
        push_back(&ans, &dummy);

    for (int i = 0; i < h->vec_size; i++)
    {
        vector *v = get(&h->vec, i);
        for (int j = 0; j < v->size; j++)
        {
            hashable *p = get(v, j);
            ast_ptr ob = p->object;
            // printf("Update %ld to %s\n", p->pos, name_decl(ob));
            set(&ans, p->pos, &ob);
        }
    }
    return ans;
}

void semantic_analysis(ast_ptr node)
{
    switch (node->node_type)
    {
    case Program:
        sem_analysis_program(node);
        break;
    case VarDecl:
    case ParamDecl:
        sem_analysis_vardecl(node);
        break;
    case FuncDecl:
        sem_analysis_funcdecl(node);
        break;
    default:
        return;
    }

    /*if (node->node_type == Program)
    {
        hash_table prog = new_hash_table("Global");
        push_back(&stack_tables, &prog);
    }
    switch (node->node_type)
    {
    case:

        break;

    default:
        break;
    }*/
}

void sem_analysis_program(ast_ptr program)
{
    hash_table prog = new_hash_table("Global", program);
    stack_tables = new_vector(sizeof(hash_table));
    vec_tables = new_vector(sizeof(hash_table));
    push_back(&stack_tables, &prog);
    for (int i = 0; i < program->children.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&program->children, i);
        semantic_analysis(ch);
    }
    hash_table *top = get(&stack_tables, 0);
    print_st_program(top);
}

void sem_analysis_vardecl(ast_ptr vardecl) // can also be used for paramdecl
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    hashable d = new_hashable(vardecl, hash_ast_ptr);
    if (contains(ht, &d, equals_decl))
    {
        // ERROR: ALREADY DECLARED
        ast_ptr id = *(ast_ptr *)get(&vardecl->children, 1);
        // printf("Line %d, column %d: Symbol %s already defined.\n", id->line, id->column, id->str);
    }
    else
    {
        insert(ht, &d);
    }
}

void sem_analysis_funcdecl(ast_ptr funcdecl)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    hashable d = new_hashable(funcdecl, hash_ast_ptr);
    if (contains(ht, &d, equals_decl))
    {
        ast_ptr header = *(ast_ptr *)get(&funcdecl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&header->children, 0);
        // printf("Line %d, column %d: Symbol %s already defined.\n", id->line, id->column, id->str);
    }
    else
    {

        insert(ht, &d);
    }
    hash_table ht_new = new_hash_table(funcdecl->str, funcdecl);
    push_back(&stack_tables, &ht_new);
    ast_ptr header = *(ast_ptr *)get(&funcdecl->children, 0);
    ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
    for (int i = 0; i < params->children.size; i++)
    {
        sem_analysis_vardecl(*(ast_ptr *)get(&params->children, i)); // other symbols added to table
    }
    ast_ptr body = *(ast_ptr *)get(&funcdecl->children, 1);
    for (int i = 0; i < body->children.size; i++)
    {
        semantic_analysis(*(ast_ptr *)get(&body->children, i));
    }
    hash_table func = *(hash_table *)get(&stack_tables, stack_tables.size - 1);
    push_back(&vec_tables, &func);
    pop_back(&stack_tables);
}

/*
    TODO: todo este código comentado só p te irritar :)
typedef struct table
{
    char *name;
} table_t;

size_t hash_my_table(void *table)
{
    return hash_string(((table_t *)table)->name);
}

const char *type_str(ast_node_type type)
{
    switch (type)
    {
    case Int:
        return var_types[0];
    case Float32:
        return var_types[1];
    case String:
        return var_types[2];
    case Bool:
        return var_types[3];
    default:
        return ""; // no association
    }
}

string table_entry_funcdecl(ast_ptr func_decl)
{
    ast_ptr header = *(ast_ptr *)get(&(func_decl->children), 0);
    ast_ptr id = *(ast_ptr *)get(&(header->children), 0);
    string ans = new_str_range(id->str + 2, id->str + strlen(id->str) - 1);
    add_char(&ans, '\t'); // name handled
    add_char(&ans, '(');
    ast_ptr params = *(ast_ptr *)get(&(header->children), header->children.size - 1); // parameters are the last
    for (int i = 0; i < params->children.size; i++)
    {
        if (i > 0)
        {
            char *sep = ", ";
            add_str_ptr(&ans, sep);
        }
        ast_ptr decl = *(ast_ptr *)get(&(params->children), i);
        ast_ptr type = *(ast_ptr *)get(&(decl->children), 0);
        add_str_ptr(&ans, type_str(type->node_type));
    }
    add_char(&ans, ')');
    add_char(&ans, '\t'); // parameters handled
    if (header->children.size == 2)
        add_str_ptr(&ans, "none"); // no return type
    else
    {
        ast_ptr type = *(ast_ptr *)get(&(header->children), 1);
        add_str_ptr(&ans, type_str(type->node_type)); // appends return type
    }

    return ans;
}

string table_entry_vardecl(ast_ptr var_decl)
{
    ast_ptr type = *(ast_ptr *)get(&(var_decl->children), 0);
    ast_ptr id = *(ast_ptr *)get(&(var_decl->children), 1);
    char *name = id->str;
    string ans = new_str_range(name + 2, name + strlen(name) - 1);
    char *app = "\t\t";
    add_str_ptr(&ans, app);
    add_str_ptr(&ans, type_str(type->node_type));
}

/*
string table_entry(ast_ptr func_decl)
{
    string ans = new_string_const("(");
    ast_ptr params = *(ast_ptr *)get(&(func_decl->children), 1);
    for (int i = 0; i < params->children.size; i++)
    {
        if (i > 0)
        {
            char *sep = ", ";
            add_str_ptr(&ans, sep);
        }
        ast_ptr decl = *(ast_ptr *)get(&(params->children), i);
        ast_ptr type = *(ast_ptr *)get(&(decl->children), 0);
        add_str_ptr(&ans, type_str(type->node_type));
    }
    add_char(&ans, ')');
    return ans;
}

void semantic(ast_ptr root)
{
    hash_table main = new_hash_table();

    table_t table;
    strcpy(table.name, "Global");

    hashable program = new_hashable(&table, hash_my_table);

    printf("===== %s Symbol Table =====\n", table.name);

    insert(&main, &program);
}

void print_table(ast_ptr a)
{
    if (a->node_type == Program)
    {
        printf("===== Global Symbol Table =====\n");
        for (int i = 0; i < a->children.size; i++)
        {
            ast_ptr ch = *(ast_ptr *)get(&(a->children), i);
            string entry;
            if (ch->node_type == FuncDecl)
            {
                entry = table_entry_funcdecl(ch);
            }
            else if (ch->node_type == VarDecl)
            {
                entry = table_entry_vardecl(ch);
            }
            printf("%s\n", (char *)entry.str.array);
            destroy_string(entry);
        }
    }
    else if (a->node_type == FuncDecl)
    {
    }
}*/