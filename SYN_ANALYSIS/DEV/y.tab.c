/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "gocompiler.y"

    #include<stdio.h>
    #include<stdarg.h>
    #include "ast_tree.c"
    #define true 1
    #define false 0
    int yylex(void);
    void yyerror (const char *s);
    void decl() {
        printf("Declarations\n");
    }
    extern char* yytext;
    extern int line, column, yyleng;
    int syn_error = 0;
    typedef enum {
        Program, VarDecl, Int, Float32, Bool, String, FuncDecl, FuncHeader, FuncParams, ParamDecl, FuncBody, Block, 
        If, For, Return, ParseArgs, Print, IntLit, RealLit, Id, StrLit,
        Or, And, Eq, Ne, Lt, Gt, Le, Ge, Add, Sub, Mul, Div, Mod,
        Not, Minus, Plus, Assign, Call,
        Rep_Statement_Semicolon, Rep_Comma_Id, Vars_Statements, Rep_Comma_Expr
    } ast_node_type;

    vector stack;

    void push_node(int node_type, char* format, char* val) {
        char*name;
        if(node_type == IntLit || node_type == RealLit || node_type == StrLit || node_type == Id) {
            name = malloc(strlen(format)+strlen(val)+2);
            sprintf(name, format, val);
        }
        else {
            name = malloc(strlen(format)+2);
            strcpy(name, format);
        }
        ast_ptr n = new_node_ptr(node_type, name);
        push_back(&stack, &n);
        // printf("Pushing node %s\n", name);
        //printf("Stack size: %ld\n", stack.size);
        free(name);
    }

    void push_with_children(int node_type, char* name, int no_children) {
        ast_ptr n = new_node_ptr(node_type, name);
        //printf("Stack size: %ld; no_children: %d\n", stack.size, no_children);
        // printf("B001 - %p\n", n);
        for(int i = stack.size-no_children; i<stack.size; i++) {
            // printf("%d\n", i);
            add_child(n, get(&stack, i));
            //print_ast_tree(*(ast_ptr*)get(&stack, i),0);
        }
        // printf("Boo2children\n");
        for(int i = 0; i<no_children; i++) pop_back(&stack);
        // printf("Boo3children\n");

        push_back(&stack, &n);
        //printf("Stack final size: %ld\n", stack.size);
    }

    ast_ptr pop_node() {
        ast_ptr* ans = get(&stack, stack.size-1);
        if(ans == NULL) {
            fprintf(stderr, "No values in stack!\n");
            exit(-1);
        }
        pop_back(&stack);
        return *ans;
    }

    void print_top() {
        printf("Top:");
        ast_ptr* ans = get(&stack, stack.size-1);
        print_ast_tree(*ans, 0);
    }

    void handle_rep(int node_type, char* name, int no_children, int reverse) {
        //printf("AWDHKAGDJ\n");
        //printf("%s\n", name);
        ast_ptr n = pop_node(), aid = n;
        vector nodes = new_vector(sizeof(ast_ptr));
        vector to_free = new_vector(sizeof(ast_ptr));
        push_back(&to_free, &aid);
        //printf("Handling node %s; no_children: %d\n", name, no_children);
        while(aid->children.size > no_children) {
            if(!reverse) {
                for(int j = 0; j<no_children; j++) {
                    // printf("Boo1.1.1\n");
                    ast_ptr st_node = (*(ast_ptr*) get(&(aid->children), j));
                    //printf("Pushing node %s\n", st_node->str);
                    push_back(&nodes, &st_node);
                }
            }
            else {
                for(int j = no_children-1; j>0; j--) {
                    // printf("Boo1.1.1\n");
                    ast_ptr st_node = (*(ast_ptr*) get(&(aid->children), j));
                    //printf("Pushing node %s\n", st_node->str);
                    push_back(&nodes, &st_node);
                }
            }
            // printf("Boo1.2\n");
            aid = (*(ast_ptr*) get(&(aid->children),no_children));
            push_back(&to_free, &aid);
            // printf("Boo1.3\n");
        }
        // printf("Boo2\n");
        if(nodes.size > 1/*no_children*/) {
            // printf("Boo2.1\n");
            ast_ptr block_node = new_node_ptr(node_type, name);
            for(int i = 0; i<nodes.size; i++) {
                push_back(&(block_node->children), get(&nodes, i));
            }
            // printf("Boo2.2\n");
            push_back(&stack, &block_node);
        }
        // printf("Boo3\n");
        if(nodes.size == 1) push_back(&stack, get(&nodes, 0));
        // printf("Boo4\n");
        for(int i = 0; i< to_free.size; i++) {
            free_ast_ptr((*(ast_ptr*)get(&to_free, i)));
        }
        // printf("Boo5\n");
        free(nodes.array);
        // printf("Boo6\n");
        free(to_free.array);
        // printf("Boo7\n");
    }

    vector flat_children(ast_ptr node, int children, int reverse) {
        vector ans = new_vector(sizeof(ast_ptr));
        vector to_free = new_vector(sizeof(ast_ptr));
        ast_ptr cur = node;
        push_back(&to_free,&cur);
        while(cur->children.size > children) {
            if(!reverse){
                for(int i = 0; i < children; i++) {
                push_back(&ans, get(&(cur->children), i));
            }
            }
            else {
                for(int i = children-1; i >= 0; i--) {
                push_back(&ans, get(&(cur->children), i));
            }
            }
            cur = *(ast_ptr*) get(&(cur->children), children);
            /*    RS
                /\ \  -> children 2
                S T RS
                /\
                S RS*/
            push_back(&to_free,&cur);
        }
        for(int i = 0; i< to_free.size; i++) {
            free_ast_ptr(*(ast_ptr*)get(&to_free, i));
        }
        free(to_free.array);
        return ans;
    }

    void yyerror(const char* s)
    {
        printf("Line %d, column %d: %s: %s\n", line, column-yyleng,s, yytext);
        syn_error=1;
    }


#line 236 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AND = 258,
    ASSIGN = 259,
    BLANKID = 260,
    BOOL = 261,
    CMDARGS = 262,
    COMMA = 263,
    DIV = 264,
    ELSE = 265,
    EQ = 266,
    FLOAT32 = 267,
    FOR = 268,
    FUNC = 269,
    GE = 270,
    GT = 271,
    ID = 272,
    IF = 273,
    INT = 274,
    INTLIT = 275,
    LBRACE = 276,
    LE = 277,
    LPAR = 278,
    LSQ = 279,
    LT = 280,
    MINUS = 281,
    MOD = 282,
    NE = 283,
    NOT = 284,
    OR = 285,
    PACKAGE = 286,
    PARSEINT = 287,
    PLUS = 288,
    PRINT = 289,
    RBRACE = 290,
    REALLIT = 291,
    RESERVED = 292,
    RETURN = 293,
    RPAR = 294,
    RSQ = 295,
    SEMICOLON = 296,
    STAR = 297,
    STRING = 298,
    STRLIT = 299,
    VAR = 300
  };
#endif
/* Tokens.  */
#define AND 258
#define ASSIGN 259
#define BLANKID 260
#define BOOL 261
#define CMDARGS 262
#define COMMA 263
#define DIV 264
#define ELSE 265
#define EQ 266
#define FLOAT32 267
#define FOR 268
#define FUNC 269
#define GE 270
#define GT 271
#define ID 272
#define IF 273
#define INT 274
#define INTLIT 275
#define LBRACE 276
#define LE 277
#define LPAR 278
#define LSQ 279
#define LT 280
#define MINUS 281
#define MOD 282
#define NE 283
#define NOT 284
#define OR 285
#define PACKAGE 286
#define PARSEINT 287
#define PLUS 288
#define PRINT 289
#define RBRACE 290
#define REALLIT 291
#define RESERVED 292
#define RETURN 293
#define RPAR 294
#define RSQ 295
#define SEMICOLON 296
#define STAR 297
#define STRING 298
#define STRLIT 299
#define VAR 300

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   210

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  28
/* YYNRULES -- Number of rules.  */
#define YYNRULES  78
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  164

#define YYUNDEFTOK  2
#define YYMAXUTOK   300


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   169,   169,   185,   186,   187,   189,   190,   192,   224,
     224,   225,   229,   233,   237,   242,   257,   269,   271,   272,
     280,   281,   283,   316,   333,   334,   335,   337,   345,   346,
     348,   349,   350,   361,   362,   363,   364,   365,   366,   367,
     368,   369,   370,   371,   372,   373,   374,   376,   400,   401,
     403,   407,   411,   412,   413,   414,   415,   416,   417,   418,
     419,   420,   421,   422,   423,   424,   425,   426,   427,   428,
     429,   430,   431,   432,   433,   434,   435,   437,   441
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "AND", "ASSIGN", "BLANKID", "BOOL",
  "CMDARGS", "COMMA", "DIV", "ELSE", "EQ", "FLOAT32", "FOR", "FUNC", "GE",
  "GT", "ID", "IF", "INT", "INTLIT", "LBRACE", "LE", "LPAR", "LSQ", "LT",
  "MINUS", "MOD", "NE", "NOT", "OR", "PACKAGE", "PARSEINT", "PLUS",
  "PRINT", "RBRACE", "REALLIT", "RESERVED", "RETURN", "RPAR", "RSQ",
  "SEMICOLON", "STAR", "STRING", "STRLIT", "VAR", "$accept", "Program",
  "Declarations", "VarDeclaration", "VarSpec", "REP_COMMA_ID", "Type",
  "FuncDeclaration", "FuncHeader", "FuncParams", "REP_COMMA_ID_TYPE",
  "Parameters", "FuncBody", "VarsAndStatements", "BLOCK",
  "REP_STATEMENT_SEMICOLON", "Statement", "ParseArgs", "REP_COMMA_EXPR",
  "FuncInvocation", "Pred5", "Pred4", "Pred3", "Pred2", "Pred1", "Expr",
  "ID_NTERM", "STRLIT_NTERM", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300
};
# endif

#define YYPACT_NINF (-53)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-30)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -26,    -5,    37,    -1,   -53,    -3,    30,    15,   -53,     3,
      10,    32,   -53,    33,    30,   -53,    61,    -3,    -3,    73,
     -53,     2,    11,    38,    30,    11,   -53,   -53,   -53,   140,
     145,    99,    58,   145,    48,    66,    63,   -53,   -53,    74,
     -53,    67,    11,   -53,   -53,   -53,   -53,   -53,    75,    61,
     -53,   -53,    99,   102,   145,   145,   145,   -53,   -53,     7,
      -2,    77,   112,    94,   109,   118,   111,   115,   -53,   103,
     123,   -53,    73,   -53,    73,   145,   148,    44,   -53,   146,
     -53,   -53,   129,   131,   133,   -53,   -53,   -53,    16,    16,
      16,    16,    16,    16,    16,    16,    16,    16,    16,    16,
      16,    99,    99,   -53,    99,   -53,   136,   138,   -53,   -53,
     -53,   175,   141,   -53,   183,    30,   -53,   -53,   -53,   -53,
     -53,   -53,   -53,   -53,   -53,   -53,   -53,   -53,   -53,   -53,
     -53,   -53,   -53,   157,   158,   -53,   -53,   -53,   162,   -53,
     145,   156,    11,   -53,   186,   174,   183,   -53,   146,   177,
     192,   -53,   -53,    99,   176,   166,   122,   -53,   163,   164,
     167,   168,   -53,   -53
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     1,     5,     0,     0,     2,     0,
       0,     0,    77,     0,     0,     6,    10,     5,     5,     0,
      15,     0,    17,     0,     0,     0,     3,     4,    42,     0,
       0,     0,     0,    36,     0,     0,     0,    39,    38,     0,
      19,     0,     0,    13,    12,    11,    14,    16,     0,    10,
       8,    50,     0,     0,     0,     0,     0,    51,    53,    59,
      62,    69,    71,    73,     0,    52,     0,     0,    27,     0,
       0,    37,     0,    23,     0,     0,     0,     0,    18,    21,
       7,     9,     0,     0,     0,    75,    74,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    31,     0,    78,     0,     0,    24,    25,
      30,     0,     0,    48,    46,     0,    22,    34,    55,    54,
      57,    58,    56,    61,    60,    65,    68,    64,    67,    63,
      66,    70,    72,     0,     0,    28,    40,    41,     0,    49,
       0,     0,     0,    35,    32,     0,    46,    47,    21,     0,
       0,    45,    20,     0,     0,     0,     0,    33,     0,     0,
       0,     0,    44,    43
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -53,   -53,    54,   -12,   188,   159,   -21,   -53,   -53,   -53,
      57,   -53,   -53,   -52,   -43,   105,    -9,   -53,    64,   -17,
     -53,   100,   -16,    89,    27,   -27,    -6,   -53
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     8,     9,    15,    25,    47,    10,    11,    22,
     116,    41,    20,    35,    67,    68,    69,    37,   141,    58,
      59,    60,    61,    62,    63,    64,    65,   107
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      13,    16,    38,    66,    50,     1,    71,    34,    16,    82,
      36,     6,     3,    39,    38,    42,    88,    43,    49,    12,
     108,    79,   109,    44,    91,    39,    84,    85,    86,    87,
      45,    92,    12,    12,    89,    38,    51,     4,    14,    53,
       5,    40,     7,   106,    17,   112,    39,    12,   110,    90,
     114,    18,    57,    19,    46,    38,    21,    38,   133,   134,
      34,    12,    34,    36,    51,    36,    39,    53,    39,    24,
      54,    26,    27,    55,    28,   123,   124,    56,    75,    48,
      57,    70,    76,   113,    38,    38,    29,    38,    93,    72,
      12,    30,    94,    95,    31,    39,    39,    77,    39,    96,
      28,    73,    97,    83,    74,    98,    78,    32,   -26,   142,
     155,    33,    29,   146,    80,    99,    12,    30,     7,    12,
      31,   148,    51,   158,   100,    53,   131,   132,    54,   159,
     101,    55,   102,    32,   -29,    56,    38,    33,    57,    12,
      12,    77,    51,    51,   104,    53,    53,    39,    54,    54,
     103,    55,    55,   111,   115,    56,    56,    12,    57,    57,
      51,    52,    12,    53,   117,    51,    54,   105,    53,    55,
     118,    54,   119,    56,    55,   136,    57,   137,    56,   138,
     139,    57,   125,   126,   127,   128,   129,   130,   120,   121,
     122,   140,   143,   144,   145,   147,   149,   150,   153,   154,
     156,   157,    23,   160,   161,   152,   162,   163,    81,   135,
     151
};

static const yytype_uint8 yycheck[] =
{
       6,     7,    19,    30,    25,    31,    33,    19,    14,    52,
      19,    14,    17,    19,    31,    21,     9,     6,    24,    17,
      72,    42,    74,    12,    26,    31,    53,    54,    55,    56,
      19,    33,    17,    17,    27,    52,    20,     0,    23,    23,
      41,    39,    45,    70,    41,     1,    52,    17,    75,    42,
      77,    41,    36,    21,    43,    72,    23,    74,   101,   102,
      72,    17,    74,    72,    20,    74,    72,    23,    74,     8,
      26,    17,    18,    29,     1,    91,    92,    33,     4,    41,
      36,    23,     8,    39,   101,   102,    13,   104,    11,    41,
      17,    18,    15,    16,    21,   101,   102,    23,   104,    22,
       1,    35,    25,     1,    41,    28,    39,    34,    35,   115,
     153,    38,    13,   140,    39,     3,    17,    18,    45,    17,
      21,   142,    20,     1,    30,    23,    99,   100,    26,   156,
      21,    29,    21,    34,    35,    33,   153,    38,    36,    17,
      17,    23,    20,    20,    41,    23,    23,   153,    26,    26,
      35,    29,    29,     5,     8,    33,    33,    17,    36,    36,
      20,    21,    17,    23,    35,    20,    26,    44,    23,    29,
      39,    26,    39,    33,    29,    39,    36,    39,    33,     4,
      39,    36,    93,    94,    95,    96,    97,    98,    88,    89,
      90,     8,    35,    35,    32,    39,    10,    23,    21,     7,
      24,    35,    14,    40,    40,   148,    39,    39,    49,   104,
     146
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    31,    47,    17,     0,    41,    14,    45,    48,    49,
      53,    54,    17,    72,    23,    50,    72,    41,    41,    21,
      58,    23,    55,    50,     8,    51,    48,    48,     1,    13,
      18,    21,    34,    38,    49,    59,    62,    63,    65,    72,
      39,    57,    72,     6,    12,    19,    43,    52,    41,    72,
      52,    20,    21,    23,    26,    29,    33,    36,    65,    66,
      67,    68,    69,    70,    71,    72,    71,    60,    61,    62,
      23,    71,    41,    35,    41,     4,     8,    23,    39,    52,
      39,    51,    60,     1,    71,    71,    71,    71,     9,    27,
      42,    26,    33,    11,    15,    16,    22,    25,    28,     3,
      30,    21,    21,    35,    41,    44,    71,    73,    59,    59,
      71,     5,     1,    39,    71,     8,    56,    35,    39,    39,
      67,    67,    67,    68,    68,    69,    69,    69,    69,    69,
      69,    70,    70,    60,    60,    61,    39,    39,     4,    39,
       8,    64,    72,    35,    35,    32,    71,    39,    52,    10,
      23,    64,    56,    21,     7,    60,    24,    35,     1,    71,
      40,    40,    39,    39
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    46,    47,    48,    48,    48,    49,    49,    50,    51,
      51,    52,    52,    52,    52,    53,    54,    54,    55,    55,
      56,    56,    57,    58,    59,    59,    59,    60,    61,    61,
      62,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    63,    63,    64,    64,    65,    65,    65,
      66,    66,    66,    66,    66,    66,    67,    67,    67,    67,
      68,    68,    68,    69,    69,    69,    69,    69,    69,    69,
      70,    70,    71,    71,    71,    71,    71,    72,    73
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     4,     3,     3,     0,     2,     5,     3,     3,
       0,     1,     1,     1,     1,     2,     4,     3,     3,     2,
       4,     0,     3,     3,     3,     3,     0,     1,     3,     0,
       3,     3,     5,     9,     4,     5,     1,     2,     1,     1,
       4,     4,     1,    11,    11,     3,     0,     5,     3,     4,
       1,     1,     1,     1,     3,     3,     3,     3,     3,     1,
       3,     3,     1,     3,     3,     3,     3,     3,     3,     1,
       3,     1,     3,     1,     2,     2,     2,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 169 "gocompiler.y"
                                                  {
                    // printf("Program - %ld\n", stack.size);
                    push_with_children(Program, "Program", stack.size);
                /*
                    S S S ->
                       RS
                     / | \
                   |S  T| RS -> S S RS ->S S S RS -> S S S
                      /\
                     S RS
                       /\
                      S RS
                        ()
                    */
                }
#line 1683 "y.tab.c"
    break;

  case 6:
#line 189 "gocompiler.y"
                              {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1);*/}
#line 1689 "y.tab.c"
    break;

  case 7:
#line 190 "gocompiler.y"
                                                  {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1);*/}
#line 1695 "y.tab.c"
    break;

  case 8:
#line 192 "gocompiler.y"
                                     {
    // ast_ptr n = new_node_ptr(VarDecl, "VarDecl");
    ast_ptr type = pop_node();
    ast_ptr rep = pop_node();
    ast_ptr id = pop_node();
    ast_ptr n = new_node_ptr(VarDecl, "VarDecl");
    if(rep->children.size==0) {
        push_back(&(n->children), &type);
        push_back(&(n->children), &id);
        push_back(&stack, &n);
    }
    
    else {
        vector to_free = new_vector(sizeof(ast_ptr));
        push_back(&(n->children), &id);
        ast_ptr aid = rep;
        push_back(&to_free, &aid);
        while(aid->children.size > 1) {
            push_back(&(n->children), get(&(aid->children), 0));
            aid = (*(ast_ptr*)get(&(aid->children), 1));
            push_back(&to_free, &aid);
        }
        push_back(&(n->children), &type);
        push_back(&stack, &n);
        for(int i = 0; i<to_free.size; i++) free_ast_ptr(*(ast_ptr*)get(&to_free, i));
        free(to_free.array);
    }
    // handle_rep(VarDecl, "VarDecl", 1);
    // ast_ptr tot = pop_node();
    // push_back(&(n->children), )

}
#line 1732 "y.tab.c"
    break;

  case 9:
#line 224 "gocompiler.y"
                                          {push_with_children(Rep_Comma_Id, "", 2);}
#line 1738 "y.tab.c"
    break;

  case 10:
#line 224 "gocompiler.y"
                                                                                       {push_node(Rep_Comma_Id, "", "");}
#line 1744 "y.tab.c"
    break;

  case 11:
#line 225 "gocompiler.y"
                    {
                    // printf("Int\n");
                    push_node(Int, "Int", "");
                }
#line 1753 "y.tab.c"
    break;

  case 12:
#line 229 "gocompiler.y"
                          {
                    // printf("Float32\n");
                    push_node(Float32, "Float32", "");
                }
#line 1762 "y.tab.c"
    break;

  case 13:
#line 233 "gocompiler.y"
                       {
                    //printf("Bool\n");
                    push_node(Bool, "Bool", "");
                }
#line 1771 "y.tab.c"
    break;

  case 14:
#line 237 "gocompiler.y"
                         {
                    //printf("String\n");
                    push_node(String, "String", "");
                }
#line 1780 "y.tab.c"
    break;

  case 15:
#line 242 "gocompiler.y"
                                      {
                    //printf("FuncDecl\n");
                    push_with_children(FuncDecl, "FuncDecl", 2);
                    //printf("FuncDecl2\n");
                    //print_ast_tree(*(ast_ptr*)get(&stack, stack.size-1),0);
    /*
                    printf("FuncDecl\n");
                    ast_ptr fdecl_node = new_node_ptr(FuncDecl, "FuncDecl");
                    for(int i = stack.size-2; i<stack.size; i++) {
                        add_child(prog_node, get(&stack, i));
                    }
                    pop_back(&stack), pop_back(&stack);
                    push_back(&stack, &fdecl_node);*/
                }
#line 1799 "y.tab.c"
    break;

  case 16:
#line 257 "gocompiler.y"
                                                {
                    // printf("FuncHeader\n");push_with_children(FuncHeader, "FuncHeader",3); print_top();
                    ast_ptr type, id , params;
                    type = pop_node();
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader");
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &type);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
#line 1816 "y.tab.c"
    break;

  case 17:
#line 269 "gocompiler.y"
                                           {/*printf("FuncHeader\n"); */push_with_children(FuncHeader, "FuncHeader",2); /*print_top();*/}
#line 1822 "y.tab.c"
    break;

  case 18:
#line 271 "gocompiler.y"
                                       {/*printf("FuncParams\n"); */push_with_children(FuncParams, "FuncParams", 1);}
#line 1828 "y.tab.c"
    break;

  case 19:
#line 272 "gocompiler.y"
                            {/*printf("FuncParams\n");*/push_node(FuncParams, "FuncParams", "");}
#line 1834 "y.tab.c"
    break;

  case 20:
#line 280 "gocompiler.y"
                                                          {/* printf("Rep_Comma_id here!!!\n"); */push_with_children(Rep_Comma_Id, "", 3);}
#line 1840 "y.tab.c"
    break;

  case 21:
#line 281 "gocompiler.y"
                      {push_node(Rep_Comma_Id, "", "");}
#line 1846 "y.tab.c"
    break;

  case 22:
#line 283 "gocompiler.y"
                                             {
    ast_ptr rp = pop_node();
    // printf("ParamDecl: children_size: %ld\n", rp->children.size);
    if(rp->children.size > 0) {
        // push_back(&stack, &rp);
        // handle_rep(ParamDecl, "ParamDecl", 2,true);
        // rp = pop_node();
        vector ch = flat_children(rp, 2, true);
        rp = new_node_ptr(ParamDecl, "ParamDecl");
        vector new_children = new_vector(sizeof(ast_ptr));
        ast_ptr type = pop_node();
        ast_ptr id = pop_node();
        push_back(&new_children, &type);
        push_back(&new_children, &id);
        for(int i =0; i< ch.size; i++) {
            push_back(&new_children, get(&(ch), i));
        }
        rp->children = new_children;
        push_back(&stack, &rp);
    }
    else {
        free_ast_ptr(rp);
        // push_with_children(ParamDecl, "ParamDecl", 2);
        ast_ptr type = pop_node();
        ast_ptr id = pop_node();
        vector new_children = new_vector(sizeof(ast_ptr));
        push_back(&new_children, &type);
        push_back(&new_children, &id);
        ast_ptr n = new_node_ptr(ParamDecl, "ParamDecl");
        n->children = new_children;
        push_back(&stack, &n);
    }
}
#line 1884 "y.tab.c"
    break;

  case 23:
#line 316 "gocompiler.y"
                                           {
    // printf("FuncBody\n");
    ast_ptr rp = pop_node();
    if(rp->children.size == 0) {
        free(rp);
        push_node(FuncBody, "FuncBody", "");
    }
    else {
        // fazer função para retornar vetor
        vector v = flat_children(rp, 1,0);
        // CAREFUL: RP HAS BEEN FREED 
        ast_ptr node = new_node_ptr(FuncBody, "FuncBody");
        node->children = v;
        push_back(&stack, &node);
    }
    // handle_rep(FuncBody, "FuncBody", 1);
}
#line 1906 "y.tab.c"
    break;

  case 24:
#line 333 "gocompiler.y"
                                                                {push_with_children(Vars_Statements, "", 2);}
#line 1912 "y.tab.c"
    break;

  case 25:
#line 334 "gocompiler.y"
                                                             {push_with_children(Vars_Statements, "", 2);}
#line 1918 "y.tab.c"
    break;

  case 26:
#line 335 "gocompiler.y"
                      {push_node(Vars_Statements, "", "");}
#line 1924 "y.tab.c"
    break;

  case 27:
#line 337 "gocompiler.y"
                               {
    // handle_rep(Block, "Block", 1, 0);
    ast_ptr rp = pop_node();
    vector ch = flat_children(rp, 1,0);
    ast_ptr n = new_node_ptr(Block, "Block");
    n->children = ch;
    push_back(&stack, &n);
}
#line 1937 "y.tab.c"
    break;

  case 28:
#line 345 "gocompiler.y"
                                                                     {push_with_children(Rep_Statement_Semicolon, "", 2);}
#line 1943 "y.tab.c"
    break;

  case 29:
#line 346 "gocompiler.y"
                           {push_node(Rep_Statement_Semicolon, "", "");}
#line 1949 "y.tab.c"
    break;

  case 30:
#line 348 "gocompiler.y"
                                     {/*printf("Assign\n");*/ push_with_children(Assign, "Assign", 2);}
#line 1955 "y.tab.c"
    break;

  case 32:
#line 350 "gocompiler.y"
                                              {
                    ast_ptr bl = pop_node();
                    ast_ptr expr = pop_node();
                    ast_ptr n = new_node_ptr(If, "If"), b = new_node_ptr(Block, "Block");
                    vector v = new_vector(sizeof(ast_ptr));
                    push_back(&v, &expr);
                    push_back(&v, &bl);
                    push_back(&v, &b);
                    n->children = v;
                    push_back(&stack, &n);
                }
#line 1971 "y.tab.c"
    break;

  case 33:
#line 361 "gocompiler.y"
                                                                       {/*printf("If\n");*/ push_with_children(If, "If", 3);}
#line 1977 "y.tab.c"
    break;

  case 34:
#line 362 "gocompiler.y"
                                          {/*printf("For\n");*/ push_with_children(For, "For", 1);}
#line 1983 "y.tab.c"
    break;

  case 35:
#line 363 "gocompiler.y"
                                               {/*printf("For\n");*/ push_with_children(For, "For", 2);}
#line 1989 "y.tab.c"
    break;

  case 36:
#line 364 "gocompiler.y"
                         {/*printf("Return\n");*/push_node(Return, "Return", "");}
#line 1995 "y.tab.c"
    break;

  case 37:
#line 365 "gocompiler.y"
                              {/*printf("Return\n");*/push_with_children(Return, "Return", 1);}
#line 2001 "y.tab.c"
    break;

  case 40:
#line 368 "gocompiler.y"
                                       {/*printf("Print\n");*/push_with_children(Print, "Print", 1);}
#line 2007 "y.tab.c"
    break;

  case 41:
#line 369 "gocompiler.y"
                                               {/*printf("Print\n");*/push_with_children(Print, "Print", 1);}
#line 2013 "y.tab.c"
    break;

  case 42:
#line 370 "gocompiler.y"
                        {/*yyerror("syntax error");*/}
#line 2019 "y.tab.c"
    break;

  case 43:
#line 371 "gocompiler.y"
                                                                                  {/*printf("Parseargs\n");*/ push_with_children(ParseArgs, "ParseArgs", 2);}
#line 2025 "y.tab.c"
    break;

  case 44:
#line 372 "gocompiler.y"
                                                                                      {/*yyerror("syntax error");*/}
#line 2031 "y.tab.c"
    break;

  case 45:
#line 373 "gocompiler.y"
                                          {push_with_children(Rep_Comma_Expr, "", 2);}
#line 2037 "y.tab.c"
    break;

  case 46:
#line 374 "gocompiler.y"
                  {push_node(Rep_Comma_Expr, "", "");}
#line 2043 "y.tab.c"
    break;

  case 47:
#line 376 "gocompiler.y"
                                                        {
                    // printf("Call\n");
                    ast_ptr rp = *(ast_ptr*)get(&stack, stack.size-1);
                    if(rp->children.size > 0) {
                        handle_rep(Call, "Call",1, 0);
                        rp = pop_node();
                        vector new_children = new_vector(sizeof(ast_ptr));
                        ast_ptr expr = pop_node();
                        ast_ptr id = pop_node();
                        push_back(&new_children, &id);
                        push_back(&new_children, &expr);
                        for(int i = 0; i< rp->children.size; i++) {
                            push_back(&new_children, get(&(rp->children), i));
                        } 
                        free(rp->children.array);
                        rp->children = new_children;
                        push_back(&stack, &rp);
                    }
                    else {
                        pop_node();
                        free_ast_ptr(rp);
                        push_with_children(Call, "Call", 2);
                    }
                }
#line 2072 "y.tab.c"
    break;

  case 48:
#line 400 "gocompiler.y"
                                     {/*printf("Call\n");*/push_with_children(Call,"Call", 1);}
#line 2078 "y.tab.c"
    break;

  case 49:
#line 401 "gocompiler.y"
                                           { /*yyerror("syntax error");*/}
#line 2084 "y.tab.c"
    break;

  case 50:
#line 403 "gocompiler.y"
               {
            // printf("IntLit(%s)\n", yytext);
            push_node(IntLit, "IntLit(%s)", yytext);
        }
#line 2093 "y.tab.c"
    break;

  case 51:
#line 407 "gocompiler.y"
                  {
            // printf("RealLit(%s)\n", yytext);
            push_node(RealLit, "RealLit(%s)", yytext);
            }
#line 2102 "y.tab.c"
    break;

  case 55:
#line 414 "gocompiler.y"
                          {/*yyerror("syntax error");*/}
#line 2108 "y.tab.c"
    break;

  case 56:
#line 415 "gocompiler.y"
                         {/*printf("Mul\n");*/push_with_children(Mul, "Mul",2);}
#line 2114 "y.tab.c"
    break;

  case 57:
#line 416 "gocompiler.y"
                          {/*printf("Div\n");*/push_with_children(Div, "Div",2);}
#line 2120 "y.tab.c"
    break;

  case 58:
#line 417 "gocompiler.y"
                          {/*printf("Mod\n");*/push_with_children(Mod, "Mod",2);}
#line 2126 "y.tab.c"
    break;

  case 60:
#line 419 "gocompiler.y"
                         {/*printf("Plus\n");*/ push_with_children(Plus, "Plus",2);}
#line 2132 "y.tab.c"
    break;

  case 61:
#line 420 "gocompiler.y"
                            {/*printf("Minus\n");*/push_with_children(Sub, "Sub",2);}
#line 2138 "y.tab.c"
    break;

  case 63:
#line 422 "gocompiler.y"
                       {/*printf("Lt\n");*/push_with_children(Lt, "Lt",2);}
#line 2144 "y.tab.c"
    break;

  case 64:
#line 423 "gocompiler.y"
                         {/*printf("Gt\n");*/push_with_children(Gt, "Gt",2);}
#line 2150 "y.tab.c"
    break;

  case 65:
#line 424 "gocompiler.y"
                         {/*printf("Eq\n");*/push_with_children(Eq, "Eq",2);}
#line 2156 "y.tab.c"
    break;

  case 66:
#line 425 "gocompiler.y"
                          {/*printf("Ne\n");*/push_with_children(Ne, "Ne",2);}
#line 2162 "y.tab.c"
    break;

  case 67:
#line 426 "gocompiler.y"
                          {/*printf("Le\n");*/push_with_children(Le, "Le",2);}
#line 2168 "y.tab.c"
    break;

  case 68:
#line 427 "gocompiler.y"
                         {/*printf("Ge\n");*/push_with_children(Ge, "Ge",2);}
#line 2174 "y.tab.c"
    break;

  case 70:
#line 429 "gocompiler.y"
                        {/*printf("And\n");*/push_with_children(And, "And",2);}
#line 2180 "y.tab.c"
    break;

  case 72:
#line 431 "gocompiler.y"
                       {/*printf("Or\n");*/push_with_children(Or, "Or",2);}
#line 2186 "y.tab.c"
    break;

  case 74:
#line 433 "gocompiler.y"
                   {/*printf("Not\n");*/push_with_children(Not, "Not",1);}
#line 2192 "y.tab.c"
    break;

  case 75:
#line 434 "gocompiler.y"
                     {/*printf("Minus\n");*/push_with_children(Minus, "Minus",1);}
#line 2198 "y.tab.c"
    break;

  case 76:
#line 435 "gocompiler.y"
                    {/*printf("Plus\n");*/push_with_children(Plus, "Plus",1);}
#line 2204 "y.tab.c"
    break;

  case 77:
#line 437 "gocompiler.y"
             {
    // printf("Id(%s)", yytext);
    push_node(Id, "Id(%s)", yytext);
}
#line 2213 "y.tab.c"
    break;

  case 78:
#line 441 "gocompiler.y"
                     {
    //printf("StrLit(%s)", yytext);
    push_node(StrLit, "StrLit(%s)", yytext);
}
#line 2222 "y.tab.c"
    break;


#line 2226 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 445 "gocompiler.y"

int main()
{
    stack = new_vector(sizeof(ast_ptr));
    yyparse();
    if(stack.size == 1 && ! syn_error)
        print_ast_tree(*(ast_ptr*)get(&stack,0), 0);

    return 0;
}
