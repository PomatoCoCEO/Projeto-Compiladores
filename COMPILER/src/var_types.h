#ifndef VAR_TYPES_H
#define VAR_TYPES_h

typedef enum
{
    INT_A,
    FLOAT32_A,
    STRING_A,
    BOOL_A,
    UNDEF_A
} var_type;

extern char *var_types[];

#endif