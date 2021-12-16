#include "code_gen.h"
// define dso_local i32 @main(i32, i8**) #0 {
enum
{
    LOCAL_VARIABLE,
    PARAM_VARIABLE,
    GLOBAL_VARIABBLE
};

int current_function_var_id;
int code_str = 0;
int if_counter = 0, for_counter = 0;
int current_function = 0;

static char *ll_types[] = {"", "i32", "double", "i1", "i8*", "", "void"};
static char *zeros[] = {"0", "0.0"};
static char *formats[] = {
    "\"%d\\0A\\00\"",
    "\"%.08lf\\0A\\00\"",
    "\"%s\\0A\\00\"",
    "\"\\0A\\00\""};
static char *bools[] = {
    "\"false\\0A\\00\"",
    "\"true\\0A\\00\""};
static char *attr1 = "private unnamed_addr constant";
static char *attr2 = ", align 1";

extern vector vec_tables, stack_tables;
void print_init()
{

    // formatting strings
    printf("@_.str_int = %s [4 x i8] c%s%s\n", attr1, formats[0], attr2);
    printf("@_.str_float = %s [8 x i8] c%s%s\n", attr1, formats[1], attr2);
    printf("@_.str_string = %s [4 x i8] c%s%s\n", attr1, formats[2], attr2);
    // boolean values
    printf("@_.false = %s [7 x i8] c%s%s\n", attr1, bools[0], attr2);
    printf("@_.true = %s [6 x i8] c%s%s\n", attr1, bools[1], attr2);
    printf("@_.new_line = %s [2 x i8] c%s%s\n", attr1, formats[3], attr2);
    printf("@program.args = global i8** null\n");
    // printf
    printf("declare i32 @atoi(i8*)\n");
    printf("declare i32 @printf(i8*, ...)\n");
}

void generate_code(ast_ptr node)
{
    switch (node->node_type)
    {
    case Program:
        generate_code_program(node); // DONE
        break;
    case FuncDecl:
        current_function_var_id = 1;
        generate_code_funcdecl(node); // DONE
        break;
    case VarDecl:
        generate_code_vardecl_local(node); // DONE
        break;
    case IntLit:
        generate_code_intlit(node); // DONE
        break;
    case RealLit:
        generate_code_reallit(node); // DONE
        break;
    case StrLit:
        generate_code_strlit(node); // DONE
        break;
    case Add:
        generate_code_add(node); // DONE
        break;
    case Sub:
        generate_code_sub(node); // DONE
        break;
    case Mul:
        generate_code_mul(node); // DONE
        break;
    case Mod:
        generate_code_mod(node); // DONE
        break;
    case Div:
        generate_code_div(node); // DONE
        break;
    case Plus:
        generate_code_plus(node); // DONE
        break;
    case Minus:
        generate_code_minus(node); // DONE
        break;
    case Ne:
        generate_code_ne(node); // DONE
        break;
    case Eq:
        generate_code_eq(node); // DONE
        break;
    case Gt:
        generate_code_gt(node); // DONE
        break;
    case Lt:
        generate_code_lt(node); // DONE
        break;
    case Ge:
        generate_code_ge(node); // DONE
        break;
    case Le:
        generate_code_le(node); // DONE
        break;
    case If:
        generate_code_if(node);
        break;
    case For:
        generate_code_for(node);
        break;
    case Or:
        generate_code_or(node); // DONE
        break;
    case And:
        generate_code_and(node); // DONE
        break;
    case Not:
        generate_code_not(node);
        break;
    case Id:
        generate_code_id(node); // DONE
        break;
    case ParseArgs:
        generate_code_parseargs(node);
        break;
    case Assign:
        generate_code_assign(node); // DONE
        break;
    case Call:
        generate_code_call(node);
        break;
    case Return:
        generate_code_return(node); // DONE
        break;
    case Print:
        generate_code_print(node);
        break;
    default:
        for (int i = 0; i < node->children.size; i++)
        {
            ast_ptr ch = *(ast_ptr *)get(&node->children, i);
            generate_code(ch);
        }
        break;
    }
}

void generate_code_program(ast_ptr node)
{
    print_init();
    for (int i = 0; i < node->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&node->children, i);
        if (child->node_type == VarDecl)
            generate_code_vardecl_global(child);
        else
            generate_code(child);
    }
}

void generate_code_funcdecl(ast_ptr node)
{
    ast_ptr header = *(ast_ptr *)get(&node->children, 0);
    ast_ptr params = *(ast_ptr *)get(&header->children, header->children.size - 1);
    ast_ptr func_name = *(ast_ptr *)get(&header->children, 0);
    var_type v;
    assign_strlit(node);
    if (header->children.size == 2)
        v = new_var_type_t(NONE_TP);
    else
    {
        ast_ptr tp = *(ast_ptr *)get(&header->children, 1);
        v = new_var_type(tp);
    }
    if (strcmp(func_name->str, "main") == 0)
    {
        printf("define i32 @%s(i32 %%local_.nargs, i8** %%local_.args", func_name->str);
        if (params->children.size > 0)
        {
            printf(", ");
        }
    }
    else
        printf("define %s @func.%s(", ll_type_str(v), func_name->str);
    for (int i = 0; i < params->children.size; i++)
    {
        ast_ptr p = *(ast_ptr *)get(&params->children, i);
        ast_ptr p_type = *(ast_ptr *)get(&p->children, 0);
        ast_ptr p_name = *(ast_ptr *)get(&p->children, 1);
        var_type t = new_var_type(p_type);
        printf("%s %%ar.%s", ll_type_str(t), p_name->str);
        if (i < params->children.size - 1)
            printf(", ");
    }
    printf(") {\n");
    if (strcmp(func_name->str, "main") == 0)
    {
        printf("store i8** %%local_.args, i8*** @program.args\n");
    }
    for (int i = 0; i < params->children.size; i++)
    {
        ast_ptr p = *(ast_ptr *)get(&params->children, i);
        ast_ptr p_type = *(ast_ptr *)get(&p->children, 0);
        ast_ptr p_name = *(ast_ptr *)get(&p->children, 1);
        var_type t = new_var_type(p_type);
        printf("%%arg.%s = alloca %s\n", p_name->str, ll_type_str(t));
        printf("store %s %%ar.%s, %s* %%arg.%s\n", ll_type_str(t), p_name->str, ll_type_str(t), p_name->str);
    }
    ast_ptr body = *(ast_ptr *)get(&node->children, 1);
    generate_code(body);
    if (strcmp(func_name->str, "main") == 0)
    {
        printf("ret i32 0\n");
    }
    else
    {
        print_return(v);
    }
    printf("}\n");
    current_function++;
}

void generate_code_vardecl_local(ast_ptr node)
{
    ast_ptr id = *(ast_ptr *)get(&node->children, 1);
    var_type v = new_var_type(node);
    printf("%%local.%s = alloca %s\n", id->str, ll_type_str(v));
    if (strcmp(ll_type_str(v), "i8*") != 0)
    {
        if (strcmp(ll_type_str(v), "double") == 0)
        {
            printf("store %s 0.0, %s* %%local.%s\n", ll_type_str(v), ll_type_str(v), id->str);
        }
        else
        {
            printf("store %s 0, %s* %%local.%s\n", ll_type_str(v), ll_type_str(v), id->str);
        }
    }
}

void generate_code_vardecl_global(ast_ptr node)
{
    ast_ptr tp = *(ast_ptr *)get(&node->children, 0);
    ast_ptr id = *(ast_ptr *)get(&node->children, 1);
    var_type v = new_var_type(tp);

    if (strcmp(ll_type_str(v), "i8*") == 0)
    {
        printf("@.%s = global %s null\n", id->str, ll_type_str(v));
    }
    else
    {
        printf("@.%s = global %s %s\n", id->str, ll_type_str(v), zero(v));
    }
}

void generate_code_add(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "f" : "");
    printf("%%%d = %sadd %s %%%d, %%%d\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_mod(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);

    printf("%%%d = srem %s %%%d, %%%d\n", current_function_var_id, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_div(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "f" : "s");
    printf("%%%d = %sdiv %s %%%d, %%%d\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_plus(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    // ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    // generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "f" : "");
    printf("%%%d = %sadd %s %%%d, %s\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id, zero(first_child->type));

    node->code_gen_id = current_function_var_id++;
}

void generate_code_minus(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);

    generate_code(first_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "f" : "");
    if(c == 'f') {
        printf("%%%d = %smul %s -1.0, %%%d\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id);
    } else {
        printf("%%%d = %smul %s -1, %%%d\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id);
    }

    node->code_gen_id = current_function_var_id++;
}

void generate_code_ne(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);

    char c = type_arith(first_child);
    char *op = (c == 'f' ? "o" : "");
    printf("%%%d = %ccmp %sne %s %%%d, %%%d\n", current_function_var_id, c, op, ll_type_str(first_child->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_eq(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "o" : "");
    printf("%%%d = %ccmp %seq %s %%%d, %%%d\n", current_function_var_id, c, op, ll_type_str(first_child->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_gt(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "o" : "s");
    printf("%%%d = %ccmp %sgt %s %%%d, %%%d\n", current_function_var_id, c, op, ll_type_str(first_child->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_lt(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "o" : "s");
    printf("%%%d = %ccmp %slt %s %%%d, %%%d\n", current_function_var_id, c, op, ll_type_str(first_child->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_ge(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "o" : "s");
    printf("%%%d = %ccmp %sge %s %%%d, %%%d\n", current_function_var_id, c, op, ll_type_str(first_child->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_le(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "o" : "s");
    printf("%%%d = %ccmp %sle %s %%%d, %%%d\n", current_function_var_id, c, op, ll_type_str(first_child->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_for(ast_ptr node)
{
    if (node->children.size == 2)
    {
        node->code_gen_id = for_counter;
        for_counter++;
        printf("br label %%cond_for_%d\n", node->code_gen_id);
        printf("cond_for_%d:\n", node->code_gen_id);
        ast_ptr cond = *(ast_ptr *)get(&node->children, 0);
        ast_ptr body = *(ast_ptr *)get(&node->children, 1);
        generate_code(cond);
        printf("br i1 %%%d, label %%for_body_%d, label %%for_end_%d\n", cond->code_gen_id, node->code_gen_id, node->code_gen_id);
        printf("for_body_%d:\n", node->code_gen_id);
        generate_code(body);
        printf("br label %%cond_for_%d\n", node->code_gen_id);
        printf("for_end_%d:\n", node->code_gen_id);
    }
    else
    {
        node->code_gen_id = for_counter;
        for_counter++;
        ast_ptr body = *(ast_ptr *)get(&node->children, 1);
        printf("br label %%for_body_%d:\n", node->code_gen_id);
        printf("for_body_%d:\n", node->code_gen_id);
        generate_code(body);
        printf("br label %%for_body_%d\n", node->code_gen_id);
        printf("for_end_%d:\n", node->code_gen_id);
    }
}

void generate_code_not(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);

    generate_code(first_child);

    printf("%%%d = sub %s 1, %%%d\n", current_function_var_id, ll_type_str(node->type), first_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_parseargs(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);

    printf("%%%d = load i8**, i8*** @program.args\n", current_function_var_id);
    current_function_var_id++;
    printf("%%%d = getelementptr i8*, i8** %%%d, i32 %%%d\n", current_function_var_id, current_function_var_id - 1, second_child->code_gen_id);
    current_function_var_id++;
    printf("%%%d = load i8*, i8** %%%d\n", current_function_var_id, current_function_var_id - 1);
    current_function_var_id++;
    printf("%%%d = call i32 @atoi(i8* %%%d)\n", current_function_var_id, current_function_var_id - 1);

    switch(type_node_id(first_child)) {
        case LOCAL_VARIABLE:
            printf("store i32 %%%d, i32* %%local.%s\n", current_function_var_id, first_child->str);
            break;
        case PARAM_VARIABLE:
            printf("store i32 %%%d, i32* %%arg.%s\n", current_function_var_id, first_child->str);
            break;
        case GLOBAL_VARIABBLE:
            printf("store i32 %%%d, i32* @.%s\n", current_function_var_id, first_child->str);
            break;
    }


    node->code_gen_id = current_function_var_id++;
}

void generate_code_sub(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "f" : "");

    printf("%%%d = %ssub %s %%%d, %%%d\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_and(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);

    printf("%%%d = and %s %%%d, %%%d\n", current_function_var_id, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_or(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);

    printf("%%%d = or %s %%%d, %%%d\n", current_function_var_id, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}
void generate_code_mul(ast_ptr node)
{
    ast_ptr first_child = *(ast_ptr *)get(&node->children, 0);
    ast_ptr second_child = *(ast_ptr *)get(&node->children, 1);

    generate_code(first_child);
    generate_code(second_child);
    char c = type_arith(first_child);
    char *op = (c == 'f' ? "f" : "");
    printf("%%%d = %smul %s %%%d, %%%d\n", current_function_var_id, op, ll_type_str(node->type), first_child->code_gen_id, second_child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_assign(ast_ptr node)
{
    ast_ptr ch2 = *(ast_ptr *)get(&node->children, 1);
    generate_code(ch2);
    ast_ptr ch1 = *(ast_ptr *)get(&node->children, 0);
    int t = type_node_id(ch1);
    switch (t)
    {
    case LOCAL_VARIABLE:
        printf("store %s %%%d, %s* %%local.%s\n", ll_type_str(node->type), ch2->code_gen_id, ll_type_str(node->type), ch1->str);
        break;
    case PARAM_VARIABLE:
        printf("store %s %%%d, %s* %%arg.%s\n", ll_type_str(node->type), ch2->code_gen_id, ll_type_str(node->type), ch1->str);
        break;
    case GLOBAL_VARIABBLE:
        printf("store %s %%%d, %s* @.%s\n", ll_type_str(node->type), ch2->code_gen_id, ll_type_str(node->type), ch1->str);
        break;
    }
}

void generate_code_intlit(ast_ptr node)
{

    size_t str_len = strlen(node->str);
    int value;

    if(str_len > 0 && node->str[0] == '0' && (node->str[1] == 'x' || node->str[1] == 'X')) {
        sscanf(node->str, "%x", &value);
    } else if(node->str[0] == '0') {
        sscanf(node->str, "%o", &value);
    } else {
        sscanf(node->str, "%d", &value);
    }

    printf("%%%d = add i32 %d, 0\n", current_function_var_id, value);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_reallit(ast_ptr node)
{
    double aid;
    char *str_aid;
    // sscanf(node->str, "%Lf", &aid);
    aid = strtod(node->str, &str_aid);
    printf("%%%d = fadd double %.8lf, 0.0\n", current_function_var_id, aid);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_strlit(ast_ptr node)
{
}

void generate_code_id(ast_ptr node)
{

    // int p = current_function;
    int t = type_node_id(node);
    switch (t)
    {
    case LOCAL_VARIABLE:
        printf("%%%d = load %s, %s* %%local.%s\n", current_function_var_id, ll_type_str(node->type), ll_type_str(node->type), node->str);
        break;
    case PARAM_VARIABLE:
        printf("%%%d = load %s, %s* %%arg.%s\n", current_function_var_id, ll_type_str(node->type), ll_type_str(node->type), node->str);
        break;
    case GLOBAL_VARIABBLE:
        printf("%%%d = load %s, %s* @.%s\n", current_function_var_id, ll_type_str(node->type), ll_type_str(node->type), node->str);
        break;
    default:
        break;
    }
    node->code_gen_id = current_function_var_id++;
}

void generate_code_call(ast_ptr node)
{
    ast_ptr func = *(ast_ptr *)get(&node->children, 0);

    for (size_t i = 1; i < node->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&node->children, i);
        generate_code(child);
    }

    if (node->type.u.type != NONE_TP)
    {
        printf("%%%d = call %s @func.%s(", current_function_var_id, ll_type_str(node->type), func->str);
        node->code_gen_id = current_function_var_id++;
    }
    else
        printf("call void @func.%s(", func->str);
    for (size_t i = 1; i < node->children.size; i++)
    {
        ast_ptr child = *(ast_ptr *)get(&node->children, i);

        printf("%s %%%d", ll_type_str(child->type), child->code_gen_id);
        if (i < node->children.size - 1)
            printf(", ");
    }
    printf(")\n");
}

void generate_code_return(ast_ptr node)
{
    ast_ptr child = *(ast_ptr *)get(&node->children, 0);

    generate_code(child);

    printf("ret %s %%%d\n", ll_type_str(child->type), child->code_gen_id);

    node->code_gen_id = current_function_var_id++;
}

void generate_code_if(ast_ptr node)
{
    ast_ptr cond = *(ast_ptr *)get(&node->children, 0);
    ast_ptr then = *(ast_ptr *)get(&node->children, 1);
    generate_code(cond);
    node->code_gen_id = if_counter;
    if_counter++;
    printf("br i1 %%%d, label %%then_%d, label %%else_%d\n", cond->code_gen_id, node->code_gen_id, node->code_gen_id);
    printf("then_%d:\n", node->code_gen_id);
    generate_code(then);
    printf("br label %%end_if_%d\n", node->code_gen_id);
    printf("else_%d:\n", node->code_gen_id);
    if (node->children.size == 3)
    {
        ast_ptr else_node = *(ast_ptr *)get(&node->children, 2);
        generate_code(else_node);
    }
    printf("br label %%end_if_%d\n", node->code_gen_id);
    printf("end_if_%d:\n", node->code_gen_id);
}

void generate_code_print(ast_ptr node)
{
    ast_ptr ch1 = *(ast_ptr *)get(&node->children, 0);
    generate_code(ch1);
    if (strcmp(ll_type_str(ch1->type), "i32") == 0)
    {
        printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_.str_int, i64 0, i64 0), i32 %%%d)\n", ch1->code_gen_id);
        current_function_var_id++;
    }
    else if ((ch1->node_type == Id || ch1->node_type == Call) && ch1->type.u.type == STRING_TP)
    {
        printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_.new_line, i64 0, i64 0))\n");

        current_function_var_id++;
    }
    else if (strcmp(ll_type_str(ch1->type), "i8*") == 0)
    {
        size_t str_len = strlen(ch1->str);
        int percent_count = 0, slash = 0;
        int escape = 0;
        for (size_t i = 0; ch1->str[i]; i++)
        {
            if (ch1->str[i] == '%')
                percent_count++;
            if (ch1->str[i] == '\\' && !escape)
            {
                slash++;
                escape = 1;
            }
            else
            {
                escape = 0;
            }
        }

        printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([%ld x i8], [%ld x i8]* @_.str_%d, i64 0, i64 0))\n", str_len + percent_count - slash, str_len + percent_count - slash, ch1->code_gen_id);
        current_function_var_id++;
    }
    else if (strcmp(ll_type_str(ch1->type), "i1") == 0)
    {
        int c = if_counter;
        printf("br i1 %%%d, label %%then_%d, label %%else_%d\n", ch1->code_gen_id, c, c);
        printf("then_%d:\n", c);
        printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @_.true, i64 0, i64 0))\n");
        printf("br label %%if_end_%d\n", c);
        printf("else_%d:\n", c);
        printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @_.false, i64 0, i64 0))\n");
        printf("br label %%if_end_%d\n", c);
        printf("if_end_%d:\n", c);
        if_counter++;
        current_function_var_id += 2;
    }
    else if (strcmp(ll_type_str(ch1->type), "double") == 0)
    {
        printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @_.str_float, i64 0, i64 0), double %%%d)\n", ch1->code_gen_id);

        current_function_var_id++;
    }
}

char *ll_type_str(var_type type)
{
    if (!type.isVec)
        return (char *)ll_types[type.u.type]; // not a vector: simply return the address
    else
    {
        char *str = malloc(sizeof("()") + sizeof("double,") * type.u.vec.size);
        str[0] = '\0'; // it's a vector of function parameters: build the string
        strcat(str, "(");
        for (int i = 0; i < type.u.vec.size; i++)
        {
            int t = *(int *)get(&(type.u.vec), i);
            strcat(str, var_type_strings[t]);
            if (i != type.u.vec.size - 1)
                strcat(str, ",");
        }
        strcat(str, ")");
        return str;
    }
}

char *zero(var_type v)
{
    return zeros[(v.u.type == FLOAT32_TP ? 1 : 0)];
}

void print_return(var_type v)
{
    switch (v.u.type)
    {
    case NONE_TP:
        printf("ret void\n");
        break;
    case INT_TP:
        printf("ret i32 0\n");
        break;
    case FLOAT32_TP:
        printf("ret double 0.0\n");
        break;
    case BOOL_TP:
        printf("ret i1 0\n");
        break;
    case STRING_TP:
        printf("ret i8* null\n");
        break;
    }
}

int type_node_id(ast_ptr node)
{
    int p = current_function;
    hash_table ht = *(hash_table *)get(&vec_tables, p);
    hashable comp = new_hashable(node, hash_ast_ptr);
    hashable *h = find(&ht, &comp, equals_decl);
    ast_ptr decl;
    if (h != NULL)
    {
        decl = (ast_ptr)h->object;
        switch (decl->node_type)
        {
        case VarDecl:
            if (decl->line > node->line || (decl->line == node->line && decl->column > node->column))
                break;
            return LOCAL_VARIABLE; // local function variable
        case ParamDecl:
            return PARAM_VARIABLE; // param variable
        default:
            break;
        }
    }
    hash_table ht_main = *(hash_table *)get(&stack_tables, 0);
    hashable *h2 = find(&ht_main, &comp, equals_decl);
    if (h2 != NULL)
        return GLOBAL_VARIABBLE; // global variable
    else
    {
        printf("PROBLEMSSSS - VARIABLE %s NOT DEFINED\n", node->str);
        exit(1);
    }

    return -1;
}

char type_arith(ast_ptr node)
{
    switch (node->type.u.type)
    {
    case INT_TP:
    case BOOL_TP:
        return 'i';
    case FLOAT32_TP:
        return 'f';
    }
    return '\0';
}

/*
    \b 08
    \t 09
    \n 0A
    \f 0C
    \r 0D
    \\ 5C
*/

void assign_strlit(ast_ptr node)
{
    for (int i = 0; i < node->children.size; i++)
    {
        ast_ptr ch = *(ast_ptr *)get(&node->children, i);
        assign_strlit(ch);
    }
    if (node->node_type == StrLit)
    {
        // printf("Boo\n");
        // char *str = strdup(node->str + 1);
        // str[strlen(str) - 1] = '\0';
        int no_extra = 0;
        int escape = 0;
        for (size_t i = 0; node->str[i]; i++)
        {
            if (node->str[i] == '%')
                no_extra++;
            if (node->str[i] == '\\' && !escape)
            {
                escape = 1;
                no_extra--;
            }
            else
            {
                escape = 0;
            }
        }
        printf("@_.str_%d = %s [%ld x i8] c\"", code_str, attr1, strlen(node->str) + no_extra);
        int prev_slash = 0;
        for (size_t i = 1; node->str[i + 1]; i++)
        {
            if (node->str[i] == '%')
                printf("%%");
            if (node->str[i] == '\\')
            {
                if (prev_slash)
                {
                    printf("5C");
                    prev_slash = 0;
                }
                else
                {
                    printf("\\");
                    prev_slash = 1;
                }
            }
            else
            {
                if (prev_slash)
                {
                    switch (node->str[i])
                    {
                    case 'b':
                        printf("08");
                        break;
                    case 't':
                        printf("09");
                        break;
                    case 'n':
                        printf("0A");
                        break;
                    case 'f':
                        printf("0C");
                        break;
                    case 'r':
                        printf("0D");
                        break;
                    case '\"':
                        printf("22");
                        break;
                    default:
                        break;
                    }
                }
                else
                {
                    printf("%c", node->str[i]);
                }
                prev_slash = 0;
            }
        }
        printf("\\0A\\00\"%s\n", attr2);
        node->code_gen_id = code_str++;
    }
}
