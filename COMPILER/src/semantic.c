#include "semantic.h"

int semantic_errors = 0;

vector stack_tables; // to be constructed as new_vector(sizeof(hash_table)) stores the hash tables in execution time
vector vec_tables;
ast_ptr current_func = NULL;
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
    current_func = funcdecl;
    ast_ptr header = *(ast_ptr *)get(&funcdecl->children, 0);
    ast_ptr id = *(ast_ptr *)get(&header->children, 0);
    ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
    var_type param_types = new_var_type(params);
    char *param_string = var_type_str(param_types);
    printf("===== Function %s%s Symbol Table =====\n", id->str, param_string);
    free(param_string);
    var_type f_type = new_var_type(funcdecl);
    printf("return\t\t%s\n", var_type_str(f_type));
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
        ast_ptr id = *(ast_ptr *)get(&decl->children, 1);
        var_type dt = new_var_type(decl_type);
        printf("%s\t\t%s\n", id->str, var_type_str(dt));
    }
    if (decl->node_type == ParamDecl)
    {
        ast_ptr decl_type = *(ast_ptr *)get(&decl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&decl->children, 1);
        var_type dt = new_var_type(decl_type);
        printf("%s\t\t%s\tparam\n", id->str, var_type_str(dt));
        /* char copy[strlen(decl_type->str) + 1];
        strcpy(copy, decl_type->str);
        copy[0] = tolower(copy[0]);
        printf("%s\t\t%s\tparam\n", id->str, copy); */
    }
    if (decl->node_type == FuncDecl)
    {
        ast_ptr header = *(ast_ptr *)get(&decl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&header->children, 0);
        ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
        var_type param_type = new_var_type(params);
        char *param_string = var_type_str(param_type);
        printf("%s\t%s\t", id->str, param_string);
        if (header->children.size == 2)
            printf("none\n");
        else
        {
            ast_ptr ret_type = *(ast_ptr *)get(&header->children, 1);
            var_type ret = new_var_type(ret_type);
            printf("%s\n", var_type_str(ret));
        }
        free(param_string);
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
            // printf("Update %ld to %s\n", p->pos, name_decl(ob));a
            set(&ans, p->pos, &ob);
        }
    }
    return ans;
}

void semantic_analysis(ast_ptr node)
{
    // printf("Analysing node %s\n", node->str);
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
    case IntLit:
    case RealLit:
    case Bool:
    case StrLit:
        node->uses++;
        node->type = new_var_type(node);
        node->annotate = var_type_str(node->type);
        // node->annotate = strdup("int");
        break;
    case Ne:
    case Eq:
        node->uses++;
        sem_analysis_equality(node);
        break;
    case Gt:
    case Lt:
    case Ge:
    case Le:
        node->uses++;
        sem_analysis_comp(node);
        break;
    case If:
        node->uses++;
        sem_analysis_if(node);
        break;
    case For:
        node->uses++;
        sem_analysis_for(node);
        break;
    case Or:
    case And:
        node->uses++;
        sem_analysis_or_and(node);
        break;
    case Id:
        node->uses++;
        sem_analysis_id(node);
        break;
    case Print:
        node->uses++;
        sem_analysis_print(node);
        break;
    case Block:
    case Return:
        node->uses++;
        sem_analysis_propagate(node);
        break;
    case Div:
    case Mod:
    case Mul:
    case Sub:
        node->uses++;
        sem_analysis_binary_math(node);
        break;
    case Add:
        node->uses++;
        sem_analysis_add(node);
        break;
    case Assign:
        node->uses++;
        sem_analysis_assign(node);
        break;
    case ParseArgs:
        node->uses++;
        sem_analysis_parseargs(node);
        break;
    case Call:
        node->uses++;
        sem_analysis_call(node);
        break;
    case Plus:
    case Minus:
    case Not:
        node->uses++;
        sem_analysis_unary_math(node);
        break;
    default:
        break;
    }
    // printf("Finished analysing node %s: type %s\n", node->str, node->annotate ? node->annotate : "");
}

void sem_analysis_program(ast_ptr program)
{
    semantic_errors = 0;
    hash_table prog = new_hash_table("Global", program);
    stack_tables = new_vector(sizeof(hash_table));
    vec_tables = new_vector(sizeof(hash_table));
    push_back(&stack_tables, &prog);
    for (int i = 0; i < program->children.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&program->children, i);
        if (ch->node_type == FuncDecl)
            add_global_function(ch);
        else
            semantic_analysis(ch);
    }
    for (int i = 0; i < program->children.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&program->children, i);
        if (ch->node_type == FuncDecl)
            semantic_analysis(ch);
    }
    hash_table *top = get(&stack_tables, 0);

    /*if (semantic_errors == 0)
        print_st_program(top);*/
}

void sem_analysis_vardecl(ast_ptr vardecl) // can also be used for paramdecl
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    hashable d = new_hashable(vardecl, hash_ast_ptr);
    if (contains(ht, &d, equals_decl))
    {
        // ERROR: ALREADY DECLARED
        ast_ptr id = *(ast_ptr *)get(&vardecl->children, 1);
        vardecl->uses++;
        if (ht->ref->valid)
            printf("Line %d, column %d: Symbol %s already defined\n", id->line, id->column, id->str);
        semantic_errors++;
    }
    else
    {
        insert(ht, &d);
    }
}

void add_global_function(ast_ptr funcdecl)
{
    // adds the function in the first passage by the program node
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    hashable d = new_hashable(funcdecl, hash_ast_ptr);
    if (contains(ht, &d, equals_decl))
    {
        ast_ptr header = *(ast_ptr *)get(&funcdecl->children, 0);
        ast_ptr id = *(ast_ptr *)get(&header->children, 0);
        funcdecl->uses++;

        printf("Line %d, column %d: Symbol %s already defined\n", id->line, id->column, id->str);
        funcdecl->valid = 0;
        semantic_errors++;
    }
    else
    {
        insert(ht, &d);
    }
}

void sem_analysis_funcdecl(ast_ptr funcdecl)
{
    current_func = funcdecl;

    hash_table ht_new = new_hash_table(funcdecl->str, funcdecl);

    push_back(&stack_tables, &ht_new);
    ast_ptr header = *(ast_ptr *)get(&funcdecl->children, 0);
    ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
    // params->type = new_var_type(params);
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

    vector nds = nodes(&func);

    for (int i = 0; i < nds.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&nds, i);
        // printf("%s: %s %d\n", name_decl(ch), ch->str, ch->uses);
        if (ch->uses == 0 && ch->node_type == VarDecl)
        {
            if (func.ref->valid)
                printf("Line %d, column %d: Symbol %s declared but never used\n", ch->line, ch->column, name_decl(ch));
            semantic_errors++;
        }
    }

    pop_back(&stack_tables);
}

void sem_analysis_if(ast_ptr ifnode)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    for (int i = 0; i < ifnode->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&ifnode->children, i);
        semantic_analysis(child);
    }
    ast_ptr b = *(ast_ptr *)get(&ifnode->children, 0);
    if (/*strcmp(b->annotate, "bool") != 0*/ !equals_var_int(b->type, BOOL_TP))
    {
        ast_ptr first_child = *(ast_ptr *)get(&ifnode->children, 0);
        if (ht->ref->valid)
            printf("Line %d, column %d: Incompatible type %s in if statement\n", first_child->line, first_child->column, b->annotate);
        semantic_errors++;
    }
}

void sem_analysis_print(ast_ptr print_node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    for (int i = 0; i < print_node->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&print_node->children, i);
        semantic_analysis(child);
    }
    ast_ptr first_child = *(ast_ptr *)get(&print_node->children, 0);
    if (ht->ref->valid && first_child->type.u.type == UNDEF_TP)
    {
        ast_ptr ref = first_child;
        if (first_child->node_type == VarDecl)
        {
            ref = *(ast_ptr *)get(&first_child->children, 1);
        }
        if (first_child->node_type == Call)
        {
            ref = *(ast_ptr *)get(&first_child->children, 0);
        }
        printf("Line %d, column %d: Incompatible type %s in fmt.Println statement\n", ref->line, ref->column, first_child->annotate);
        semantic_errors++;
    }
}

void sem_analysis_for(ast_ptr fornode)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    for (int i = 0; i < fornode->children.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&fornode->children, i);
        semantic_analysis(ch);
    }
    if (fornode->children.size == 2)
    {
        ast_ptr condition = *(ast_ptr *)get(&fornode->children, 0);
        if (condition->type.u.type != BOOL_TP)
        {
            ast_ptr first_child = *(ast_ptr *)get(&fornode->children, 0);
            if (ht->ref->valid)
                printf("Line %d, column %d: Incompatible type %s in for statement\n", first_child->line, first_child->column, condition->annotate);
            semantic_errors++;
        }
    }
}

void sem_analysis_or_and(ast_ptr propnode)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1 = *(ast_ptr *)get(&propnode->children, 0);
    ast_ptr ch2 = *(ast_ptr *)get(&propnode->children, 1);
    semantic_analysis(ch1);
    semantic_analysis(ch2);

    if (!equals_var_type(&ch1->type, &ch2->type) || !equals_var_int(ch1->type, BOOL_TP) /*strcmp(ch1->annotate, ch2->annotate) != 0 || strcmp(ch1->annotate, "bool") != 0*/)
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", propnode->line, propnode->column, propnode->str, ch1->annotate, ch2->annotate);
        semantic_errors++;
        propnode->type = new_var_type_t(BOOL_TP);
        propnode->annotate = var_type_str(propnode->type);
        return;
    }
    propnode->type = new_var_type_t(BOOL_TP);
    propnode->annotate = var_type_str(propnode->type);
}

void sem_analysis_comp(ast_ptr propnode)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1, ch2;
    ch1 = *(ast_ptr *)get(&propnode->children, 0);
    ch2 = *(ast_ptr *)get(&propnode->children, 1);
    semantic_analysis(ch1);
    semantic_analysis(ch2);

    if (!equals_var_type(&ch1->type, &ch2->type) || ch1->type.u.type == UNDEF_TP || ch1->type.u.type == BOOL_TP)
    {
        if (ht->ref->valid)
        {
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", propnode->line, propnode->column,
                   propnode->str, ch1->annotate, ch2->annotate);
        }
        semantic_errors++;
        // propnode->annotate = strdup("bool");
        propnode->type = new_var_type_t(BOOL_TP);
    }
    else
    {
        propnode->type = new_var_type_t(BOOL_TP);
    }
    propnode->annotate = var_type_str(propnode->type);
}

void sem_analysis_equality(ast_ptr propnode)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1, ch2;
    ch1 = *(ast_ptr *)get(&propnode->children, 0);
    ch2 = *(ast_ptr *)get(&propnode->children, 1);
    semantic_analysis(ch1);
    semantic_analysis(ch2);

    if (!equals_var_type(&ch1->type, &ch2->type) || equals_var_int(ch1->type, UNDEF_TP))
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", propnode->line, propnode->column, propnode->str, ch1->annotate, ch2->annotate);
        semantic_errors++;
        // propnode->annotate = strdup("bool");
        propnode->type = new_var_type_t(BOOL_TP);
    }
    else
    {
        propnode->type = new_var_type_t(BOOL_TP);
    }

    propnode->annotate = var_type_str(propnode->type);
}

void sem_analysis_id(ast_ptr id) // only used in var declarations
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    int pos = stack_tables.size - 1;
    hashable id_hash = new_hashable(id, hash_ast_ptr);
    while (pos >= 0)
    {
        hash_table *aid = get(&stack_tables, pos);
        hashable *f = find(aid, &id_hash, equals_decl);
        if (f != NULL)
        {
            ast_ptr decl = f->object;
            if (decl->node_type == FuncDecl)
            {
                if (ht->ref->valid)
                    printf("Line %d, column %d: Cannot find symbol %s\n", id->line, id->column, id->str);
                semantic_errors++;
                id->type = new_var_type_t(UNDEF_TP);
                id->annotate = var_type_str(id->type);
                return;
            }
            ast_ptr type = *(ast_ptr *)get(&decl->children, 0);
            // printf("id string of type: %s\n", type->str);
            id->type = new_var_type(type);
            // printf("Id Type: %d\n", id->type.u.type);
            id->annotate = var_type_str(id->type);
            // printf("Id annotate: %s\n", id->annotate);
            decl->uses++;
            break;
        }
        pos--;
    }
    if (pos < 0)
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Cannot find symbol %s\n", id->line, id->column, id->str);
        semantic_errors++;
        id->type = new_var_type_t(UNDEF_TP);
        id->annotate = var_type_str(id->type);
        return;
    }
}

void sem_analysis_propagate(ast_ptr node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    for (int i = 0; i < node->children.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&node->children, i);
        semantic_analysis(ch);
    }

    if (node->node_type == Return)
    {
        // printf("Analysing Return\n");
        //  float32\0
        //  char copy[10];
        ast_ptr header = *(ast_ptr *)get(&current_func->children, 0);
        // printf("Analysing Return\n");
        if (header->children.size == 3)
        {
            ast_ptr type = *(ast_ptr *)get(&header->children, 1);
            // printf("Type:%sn\n", type->str);
            node->type = new_var_type(type);
        }
        else
        {
            node->type = new_var_type_t(NONE_TP);
        }
        // printf("Node type: %s\n", var_type_str(node->type));
        // node->annotate = var_type_str(node->type);
        var_type current;
        if (node->children.size > 0)
        {
            ast_ptr ch = *(ast_ptr *)get(&node->children, 0);
            // strcpy(current, ch->annotate);
            current = copy_var_type_t(ch->type); // ch->type;
        }
        else
        {
            // strcpy(current, "none");
            current = new_var_type_t(NONE_TP);
        }
        // printf("Ret2\n");
        if (!equals_var_type(&node->type, &current) /*strcmp(copy, current) != 0*/)
        {
            semantic_errors++;
            if (node->children.size > 0)
            {
                // printf("My child?\n");
                ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
                if (ht->ref->valid)
                    printf("Line %d, column %d: Incompatible type %s in return statement\n", first_child->line, first_child->column, var_type_str(current));
            }
            else
            {
                if (ht->ref->valid)
                    printf("Line %d, column %d: Incompatible type %s in return statement\n", node->line, node->column, var_type_str(current));
            }
        }
        // printf("Boo\n");
    }
}

void sem_analysis_binary_math(ast_ptr node)
{
    // printf("Binary math\n");
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1, ch2;
    ch1 = *(ast_ptr *)get(&node->children, 0);
    ch2 = *(ast_ptr *)get(&node->children, 1);
    semantic_analysis(ch1);
    semantic_analysis(ch2);
    // printf("Analysing %s\n", node->str);
    // printf("Type1: %d, type2: %d", new_var_type(ch1).u.type, new_var_type(ch1).u.type);
    if (node->node_type == Mod)
    {
        if (/* strcmp(ch1->annotate, ch2->annotate) == 0 */ equals_var_type(&ch1->type, &ch2->type) && !equals_var_int(ch1->type, INT_TP) /*strcmp(ch1->annotate, "int") != 0*/)
        {
            if (ht->ref->valid)
                printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", node->line, node->column, node->str, ch1->annotate, ch2->annotate);
            semantic_errors++;
            node->type = new_var_type_t(UNDEF_TP);
            node->annotate = var_type_str(node->type);
            return;
        }
    }

    if (!equals_var_type(&ch1->type, &ch2->type) || equals_var_int(ch1->type, BOOL_TP) || equals_var_int(ch1->type, STRING_TP) || equals_var_int(ch1->type, UNDEF_TP) || equals_var_int(ch1->type, NONE_TP))
    {
        // printf("Boo\n");
        if (ht->ref->valid)
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", node->line, node->column, node->str, ch1->annotate, ch2->annotate);
        semantic_errors++;
        node->type = new_var_type_t(UNDEF_TP);
        node->annotate = var_type_str(node->type);
        // printf("Boo2\n");
        return;
    }
    node->type = copy_var_type_t(ch1->type);
    node->annotate = var_type_str(node->type);
    // node->annotate = strdup(ch1->annotate);
}

void sem_analysis_assign(ast_ptr node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1, ch2;
    ch1 = *(ast_ptr *)get(&node->children, 0);
    ch2 = *(ast_ptr *)get(&node->children, 1);
    semantic_analysis(ch1);
    semantic_analysis(ch2);

    if (!equals_var_type(&ch1->type, &ch2->type) || equals_var_int(ch1->type, UNDEF_TP) || equals_var_int(ch2->type, NONE_TP) /*strcmp(ch1->annotate, ch2->annotate) != 0 || strcmp(ch1->annotate, "undef") == 0*/)
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", node->line, node->column, node->str, ch1->annotate, ch2->annotate);
        semantic_errors++;
        node->type = new_var_type_t(UNDEF_TP);
        node->annotate = var_type_str(node->type);
        return;
    }
    // node->annotate = strdup(ch1->annotate);
    node->type = copy_var_type_t(ch1->type);
    node->annotate = var_type_str(node->type);
}

void sem_analysis_add(ast_ptr node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1, ch2;
    ch1 = *(ast_ptr *)get(&node->children, 0);
    ch2 = *(ast_ptr *)get(&node->children, 1);
    semantic_analysis(ch1);
    semantic_analysis(ch2);

    if (!equals_var_type(&ch1->type, &ch2->type) || equals_var_int(ch1->type, BOOL_TP) || equals_var_int(ch1->type, UNDEF_TP) || equals_var_int(ch2->type, NONE_TP))
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", node->line, node->column, node->str, ch1->annotate, ch2->annotate);
        semantic_errors++;
        node->type = new_var_type_t(UNDEF_TP);
        node->annotate = var_type_str(node->type);
        return;
    }
    node->type = copy_var_type_t(ch1->type);
    node->annotate = var_type_str(node->type);
}

void sem_analysis_unary_math(ast_ptr node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    ast_ptr ch1;
    ch1 = *(ast_ptr *)get(&node->children, 0);
    semantic_analysis(ch1);

    switch (node->node_type)
    {
    case Not:
        if (!equals_var_int(ch1->type, BOOL_TP) /*strcmp(ch1->annotate, "bool") != 0*/)
        {
            if (ht->ref->valid)
                printf("Line %d, column %d: Operator %s cannot be applied to type %s\n", node->line, node->column, node->str, ch1->annotate);
            semantic_errors++;
            // node->annotate = strdup("bool");
            node->type = new_var_type_t(BOOL_TP);
            node->annotate = var_type_str(node->type);
            return;
        }
        break;
    case Minus:
    case Plus:

        if (!equals_var_int(ch1->type, INT_TP) && !equals_var_int(ch1->type, FLOAT32_TP) /* strcmp(ch1->annotate, "int") != 0 && strcmp(ch1->annotate, "float32") != 0 */)
        {
            if (ht->ref->valid)
                printf("Line %d, column %d: Operator %s cannot be applied to type %s\n", node->line, node->column, node->str, ch1->annotate);
            semantic_errors++;
            node->type = new_var_type_t(UNDEF_TP);
            node->annotate = var_type_str(node->type);
            return;
        }
        break;
    }
    node->type = copy_var_type_t(ch1->type);
    node->annotate = var_type_str(node->type);
}

void sem_analysis_parseargs(ast_ptr node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1);
    sem_analysis_propagate(node);
    ast_ptr ch1 = *(ast_ptr *)get(&node->children, 0);
    ast_ptr ch2 = *(ast_ptr *)get(&node->children, 1);
    if (!equals_var_int(ch1->type, INT_TP) || !equals_var_int(ch2->type, INT_TP) /* strcmp(ch1->annotate, "int") != 0 || strcmp(ch2->annotate, "int") != 0 */)
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Operator %s cannot be applied to types %s, %s\n", node->line, node->column, node->str, ch1->annotate, ch2->annotate);
        semantic_errors++;
        node->type = new_var_type_t(UNDEF_TP);
        node->annotate = var_type_str(node->type);
        return;
    }
    node->type = copy_var_type_t(ch1->type);
    node->annotate = var_type_str(node->type);
}

void sem_analysis_call(ast_ptr node)
{
    hash_table *ht = get(&stack_tables, stack_tables.size - 1); // check outermost table
    for (int i = 1; i < node->children.size; i++)
    {
        ast_ptr c = *(ast_ptr *)get(&node->children, i);
        semantic_analysis(c); // see children
    }
    ast_ptr id = *(ast_ptr *)get(&node->children, 0);
    ast_ptr func_ref;
    hashable d = new_hashable(id, hash_ast_ptr); // hashing the id to see if we find it
    int pos = stack_tables.size - 1;
    while (pos >= 0)
    {
        hash_table *aid = get(&stack_tables, pos);
        hashable *f = find(aid, &d, equals_decl);

        if (f != NULL)
        {
            func_ref = f->object;
            // printf("func_ref: %s\n", func_ref->str);
            if (func_ref->node_type != FuncDecl)
            {
                // printf("not funcdecl\n");
                pos = -1;
                break;
            }
            func_ref->uses++;
            break;
        }

        pos--;
    }
    var_type args;
    args.isVec = 1;
    args.u.vec = new_vector(sizeof(int));
    // char *args = malloc(11 * node->children.size + 10);
    // args[0] = 0;

    // strcat(args, "(");
    for (int i = 1; i < node->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&node->children, i);
        // printf("Pushing type %s or %d\n", child->annotate, child->type.u.type);
        var_type v = copy_var_type_t(child->type); // new_var_type(child);
        push_back(&(args.u.vec), &(v.u.type));
        // printf("Args size: %ld\n", args.u.vec.size);
        //  char *copy = strdup(child->annotate);
        //  char copy[strlen(child->annotate) + 1];
        //  strcpy(copy, child->annotate);
        //  copy[0] = tolower(copy[0]);
        //  strcat(args, copy);
        //  free(copy);
        //  if (i < node->children.size - 1)
        //      strcat(args, ",");
    }
    // strcat(args, ")");
    id->type = args;
    id->annotate = var_type_str(id->type);
    // id->annotate = args;
    // printf("Call1\n");
    if (pos >= 0)
    {
        ast_ptr header = *(ast_ptr *)get(&func_ref->children, 0);

        if (header->children.size == 3)
        {
            ast_ptr type = *(ast_ptr *)get(&header->children, 1);
            var_type v = new_var_type(type);
            node->type = v;
            node->annotate = var_type_str(node->type);
            /* char *copy = strdup(type->str);
            copy[0] = tolower(copy[0]);
            node->annotate = copy; */
        }
        else
        {
            node->type = new_var_type_t(NONE_TP);
            node->annotate = var_type_str(node->type);
            /* char *copy = strdup("none");
            copy[0] = tolower(copy[0]);
            node->annotate = copy; */
        }

        ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
        // printf("params type: %s %d\n", params->str, params->node_type);
        var_type func_args = new_var_type(params);
        /* printf("func args has vector?\n");
        printf("%d\n", func_args.isVec);
        printf("args type is vector? %d\n", args.isVec);
        printf("sizes: %ld and %ld\n", func_args.u.vec.size, args.u.vec.size);
        f */
        // printf("Call1.1\n");
        /*for (int i = 0; i < args.u.vec.size; i++)
        {
            int f1, f2;
            f1 = *(int *)get(&(args.u.vec), i);
            f2 = *(int *)get(&(func_args.u.vec), i);
            printf("f1=%d, f2=%d\n", f1, f2);
        }*/
        // printf("func args is a vector? %s\n", func_args.isVec);
        /*char *current_args = malloc(11 * params->children.size + 10);
        current_args[0] = 0;

        strcat(current_args, "(");
        for (int i = 0; i < params->children.size; i++)
        {
            ast_ptr paramdecl = *(ast_ptr *)get(&params->children, i);
            ast_ptr paramtype = *(ast_ptr *)get(&paramdecl->children, 0);
            char copy[strlen(paramtype->str) + 1];
            strcpy(copy, paramtype->str);
            copy[0] = tolower(copy[0]);
            strcat(current_args, copy);
            if (i < params->children.size - 1)
                strcat(current_args, ",");
        }
        strcat(current_args, ")");*/
        // if (strcmp(args, current_args) != 0)
        if (!equals_var_type(&args, &func_args))
        {
            pos = -1;
            // printf("Not equal: %s and %s\n", var_type_str(args), var_type_str(func_args));
        }
    }
    // printf("Call2\n");

    if (pos < 0)
    {
        if (ht->ref->valid)
            printf("Line %d, column %d: Cannot find symbol %s%s\n", id->line, id->column, id->str, var_type_str(args));
        semantic_errors++;
        // node->annotate = strdup("undef");
        node->type = new_var_type_t(UNDEF_TP);
        node->annotate = var_type_str(node->type);
        return;
    }
}