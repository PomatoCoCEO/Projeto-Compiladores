typedef enum
{
    INT_A,
    FLOAT32_A,
    STRING_A,
    BOOL_A,
    UNDEF_A
} var_type;
const char *var_types[] = {
    "int", "float32", "string", "bool", "none", "undef"};