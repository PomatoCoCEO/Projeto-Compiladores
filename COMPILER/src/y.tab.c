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

#include "ast_tree.h"
#include "tokens.h"

int yylex();
void yyerror(char *);
extern vector stack;


#line 80 "y.tab.c"

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
union YYSTYPE
{
#line 11 "gocompiler.y"

    token_t * token_id;

#line 226 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
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
#define YYLAST   220

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  29
/* YYNRULES -- Number of rules.  */
#define YYNRULES  80
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  167

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
       0,    19,    19,    49,    50,    51,    53,    54,    56,    89,
      89,    90,    91,    92,    93,    95,    97,   108,   118,   129,
     131,   132,   134,   163,   190,   191,   192,   193,   195,   202,
     203,   205,   206,   207,   219,   220,   221,   222,   223,   224,
     225,   226,   227,   228,   229,   230,   231,   232,   234,   258,
     259,   261,   264,   267,   268,   269,   270,   271,   272,   273,
     274,   275,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   293,   296,
     299
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
  "ID_NTERM", "STRLIT_NTERM", "ERR_NTERM", YY_NULLPTR
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

#define YYPACT_NINF (-51)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-31)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      14,    16,    47,    23,   -51,    -3,    49,    64,   -51,    35,
      43,    70,   -51,    62,    49,   -51,    88,    -3,    -3,    93,
     -51,    -5,    37,    52,    49,    37,   -51,   -51,   -51,   170,
     178,   134,    75,   178,    93,    59,    72,    74,   -51,   -51,
      12,   -51,   -51,    78,    37,   -51,   -51,   -51,   -51,   -51,
      79,    88,   -51,   -51,   134,   141,   178,   178,   178,   -51,
     -51,   -51,    17,    46,    67,   110,     2,    96,     6,    87,
     -51,    83,   156,    90,   -51,    93,   -51,    93,   178,   121,
     120,   -51,   117,   -51,   -51,    94,    31,    91,   -51,   -51,
     -51,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   134,   178,   134,   -51,   134,   -51,    38,
      97,   -51,   -51,    90,   128,   -51,    11,   102,    49,   -51,
     -51,   -51,   -51,   -51,   -51,   -51,    17,    17,    46,    46,
      46,    46,    46,    46,    67,   109,   110,   113,   -51,   -51,
     -51,   122,   178,   106,   -51,    37,   -51,   147,   137,    11,
     -51,   117,   142,   155,   -51,   -51,   134,   151,   130,   141,
     -51,    -9,   126,   132,   139,   -51,   -51
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     1,     5,     0,     0,     2,     0,
       0,     0,    78,     0,     0,     6,    10,     5,     5,     0,
      15,     0,    17,     0,     0,     0,     3,     4,    80,     0,
       0,     0,     0,    37,     0,     0,     0,     0,    40,    39,
       0,    43,    19,     0,     0,    13,    12,    11,    14,    16,
       0,    10,     8,    51,     0,     0,     0,     0,     0,    52,
      54,    63,    66,    73,    75,    77,     0,    53,     0,     0,
      28,     0,     0,    38,    27,     0,    23,     0,     0,     0,
       0,    18,    21,     7,     9,     0,     0,     0,    57,    56,
      58,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    32,     0,    79,     0,
       0,    24,    25,    31,     0,    49,    47,     0,     0,    22,
      35,    55,    59,    61,    62,    60,    65,    64,    69,    72,
      68,    71,    67,    70,    74,     0,    76,     0,    29,    41,
      42,     0,     0,     0,    50,     0,    36,    33,     0,    47,
      48,    21,     0,     0,    46,    20,     0,     0,     0,     0,
      34,     0,     0,     0,     0,    44,    45
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -51,   -51,    85,    45,   166,   133,   -22,   -51,   -51,   -51,
      30,   -51,   -51,   -24,   -48,    76,   -10,   -51,    39,   -17,
     -18,    10,   119,    84,    98,   -26,    -6,   -51,   -50
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     8,    35,    15,    25,    49,    10,    11,    22,
     119,    43,    20,    36,    69,    70,    71,    38,   143,    60,
      61,    62,    63,    64,    65,    66,    67,   110,    41
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      13,    16,    39,    52,    68,    87,    85,    73,    16,    37,
      74,     6,    12,    40,    39,    44,    78,    39,    51,   142,
      79,   104,    82,   103,    37,    40,    91,   105,    40,    86,
     117,   163,   104,     3,    42,    80,   104,    39,    88,    89,
      90,   104,     7,    45,    92,     1,   109,     4,    40,    46,
       9,   111,   113,   112,   116,   135,    47,   137,    39,    93,
      39,   104,     9,     9,     5,    37,    12,    37,   104,    40,
     121,    40,    94,   123,   124,   125,    17,   139,    96,    95,
      48,    12,    97,    98,    18,    21,    39,    14,    39,    99,
      39,    19,   100,    50,    28,   101,    24,    40,    72,    40,
      75,    40,    26,    27,   126,   127,    29,    76,   158,   162,
      12,    30,   145,   102,    31,    77,   149,    81,    83,    80,
     104,    28,   106,   151,   107,   118,   114,    32,   -26,   120,
     122,    33,   141,   161,    34,    28,   140,    12,     7,    39,
      53,   144,    28,    55,   146,   150,    56,    29,   147,    57,
      40,    12,    30,    58,   148,    31,    59,   152,    12,   115,
     153,    53,   157,   156,    55,   160,   164,    56,    32,   -30,
      57,   165,    33,    12,    58,   159,    53,    59,   166,    55,
      23,   155,    56,   138,    84,    57,   134,    12,   154,    58,
      53,    54,    59,    55,     0,    12,    56,     0,    53,    57,
     108,    55,   136,    58,    56,     0,    59,    57,     0,     0,
       0,    58,     0,     0,    59,   128,   129,   130,   131,   132,
     133
};

static const yytype_int16 yycheck[] =
{
       6,     7,    19,    25,    30,    55,    54,    33,    14,    19,
      34,    14,    17,    19,    31,    21,     4,    34,    24,     8,
       8,    30,    44,    21,    34,    31,     9,    21,    34,    55,
      80,    40,    30,    17,    39,    23,    30,    54,    56,    57,
      58,    30,    45,     6,    27,    31,    72,     0,    54,    12,
       5,    75,    78,    77,    80,   103,    19,   105,    75,    42,
      77,    30,    17,    18,    41,    75,    17,    77,    30,    75,
      39,    77,    26,    91,    92,    93,    41,    39,    11,    33,
      43,    17,    15,    16,    41,    23,   103,    23,   105,    22,
     107,    21,    25,    41,     1,    28,     8,   103,    23,   105,
      41,   107,    17,    18,    94,    95,    13,    35,   156,   159,
      17,    18,   118,     3,    21,    41,   142,    39,    39,    23,
      30,     1,    35,   145,    41,     8,     5,    34,    35,    35,
      39,    38,     4,   159,    41,     1,    39,    17,    45,   156,
      20,    39,     1,    23,    35,    39,    26,    13,    35,    29,
     156,    17,    18,    33,    32,    21,    36,    10,    17,    39,
      23,    20,     7,    21,    23,    35,    40,    26,    34,    35,
      29,    39,    38,    17,    33,    24,    20,    36,    39,    23,
      14,   151,    26,   107,    51,    29,   102,    17,   149,    33,
      20,    21,    36,    23,    -1,    17,    26,    -1,    20,    29,
      44,    23,   104,    33,    26,    -1,    36,    29,    -1,    -1,
      -1,    33,    -1,    -1,    36,    96,    97,    98,    99,   100,
     101
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    31,    47,    17,     0,    41,    14,    45,    48,    49,
      53,    54,    17,    72,    23,    50,    72,    41,    41,    21,
      58,    23,    55,    50,     8,    51,    48,    48,     1,    13,
      18,    21,    34,    38,    41,    49,    59,    62,    63,    65,
      72,    74,    39,    57,    72,     6,    12,    19,    43,    52,
      41,    72,    52,    20,    21,    23,    26,    29,    33,    36,
      65,    66,    67,    68,    69,    70,    71,    72,    71,    60,
      61,    62,    23,    71,    59,    41,    35,    41,     4,     8,
      23,    39,    52,    39,    51,    60,    71,    74,    66,    66,
      66,     9,    27,    42,    26,    33,    11,    15,    16,    22,
      25,    28,     3,    21,    30,    21,    35,    41,    44,    71,
      73,    59,    59,    71,     5,    39,    71,    74,     8,    56,
      35,    39,    39,    66,    66,    66,    67,    67,    68,    68,
      68,    68,    68,    68,    69,    60,    70,    60,    61,    39,
      39,     4,     8,    64,    39,    72,    35,    35,    32,    71,
      39,    52,    10,    23,    64,    56,    21,     7,    60,    24,
      35,    71,    74,    40,    40,    39,    39
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    46,    47,    48,    48,    48,    49,    49,    50,    51,
      51,    52,    52,    52,    52,    53,    54,    54,    55,    55,
      56,    56,    57,    58,    59,    59,    59,    59,    60,    61,
      61,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      62,    62,    62,    62,    63,    63,    64,    64,    65,    65,
      65,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      67,    67,    67,    67,    68,    68,    68,    69,    69,    69,
      69,    69,    69,    69,    70,    70,    71,    71,    72,    73,
      74
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     4,     3,     3,     0,     2,     5,     3,     3,
       0,     1,     1,     1,     1,     2,     4,     3,     3,     2,
       4,     0,     3,     3,     3,     3,     0,     2,     1,     3,
       0,     3,     3,     5,     9,     4,     5,     1,     2,     1,
       1,     4,     4,     1,    11,    11,     3,     0,     5,     3,
       4,     1,     1,     1,     1,     3,     2,     2,     2,     3,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     3,
       3,     3,     3,     1,     3,     1,     3,     1,     1,     1,
       1
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
#line 19 "gocompiler.y"
                                                  {
                    push_with_children(Program, "Program", stack.size, 0, 0);
                    ast_ptr n = *(ast_ptr*)get(&stack,0);
                    vector d = new_vector(sizeof(ast_ptr));
                    for(size_t i = 0; i<n->children.size; i++) {
                        ast_ptr ch = *(ast_ptr*)get(&(n->children), i);
                        if(ch->node_type == VarSpec) {
                            for(size_t j = 0; j<(ch->children.size); j++) {
                                push_back(&d, get(&(ch->children), j));
                            }
                            // free_ast_ptr(ch);
                        }
                        else push_back(&d, &ch);
                    }
                    free(n->children.array);
                    n->children = d;

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
#line 1555 "y.tab.c"
    break;

  case 6:
#line 53 "gocompiler.y"
                              {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl", 1, $1->line, $1->column);*/}
#line 1561 "y.tab.c"
    break;

  case 7:
#line 54 "gocompiler.y"
                                                  {/*printf("VarDecl\n");push_with_children(VarDecl, "VarDecl",1, $1->line, $1->column);*/}
#line 1567 "y.tab.c"
    break;

  case 8:
#line 56 "gocompiler.y"
                                     {
    ast_ptr type = pop_node();
    ast_ptr rep = pop_node();
    ast_ptr id = pop_node();
    ast_ptr v_spec = new_node_ptr(VarSpec, "", id->line, id->column);
    ast_ptr n = new_node_ptr(VarDecl, "VarDecl", id->line, id->column);

    push_back(&(n->children), &type);
    push_back(&(n->children), &id);
    push_back(&(v_spec->children), &n);
   
    if(rep->children.size >0) {
        // vector to_free = new_vector(sizeof(ast_ptr));
        ast_ptr aid = rep;
        // push_back(&to_free, &aid);
        while(aid->children.size > 1) {
            ast_ptr _id = *(ast_ptr*)get(&(aid->children), 0);
            ast_ptr ch = new_node_ptr(VarDecl, "VarDecl", _id->line, _id->column );
            ast_ptr t = new_node_ptr(type->node_type, type->str, 0, 0);
            // printf("Boo1\n");
            push_back(&(ch->children), &t);
            push_back(&(ch->children), get(&(aid->children), 0));
            // push_back(&stack, &ch);
            //printf("Boo1\n");
            push_back(&(v_spec->children), &ch);
            aid = (*(ast_ptr*)get(&(aid->children), 1));
            // push_back(&to_free, &aid);
        }
        // for(size_t i = 0; i<to_free.size; i++) free_ast_ptr(*(ast_ptr*)get(&to_free, i));
        // free(to_free.array);
    }
    push_back(&stack, &v_spec);
}
#line 1605 "y.tab.c"
    break;

  case 9:
#line 89 "gocompiler.y"
                                          {push_with_children(Rep_Comma_Id, "", 2, 0, 0);}
#line 1611 "y.tab.c"
    break;

  case 10:
#line 89 "gocompiler.y"
                                                                                             {push_node(Rep_Comma_Id, "", "", 0, 0);}
#line 1617 "y.tab.c"
    break;

  case 11:
#line 90 "gocompiler.y"
                                        { P_NODE(Int, "", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column); }
#line 1623 "y.tab.c"
    break;

  case 12:
#line 91 "gocompiler.y"
                                        { P_NODE(Float32, "", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column); }
#line 1629 "y.tab.c"
    break;

  case 13:
#line 92 "gocompiler.y"
                                        { P_NODE(Bool, "", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column); }
#line 1635 "y.tab.c"
    break;

  case 14:
#line 93 "gocompiler.y"
                                        { P_NODE(String, "", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column); }
#line 1641 "y.tab.c"
    break;

  case 15:
#line 95 "gocompiler.y"
                                      { push_with_children(FuncDecl, "FuncDecl", 2, 0, 0); }
#line 1647 "y.tab.c"
    break;

  case 16:
#line 97 "gocompiler.y"
                                                {
                    ast_ptr type, id , params;
                    type = pop_node();
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader", 0, 0);
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &type);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
#line 1663 "y.tab.c"
    break;

  case 17:
#line 108 "gocompiler.y"
                                           {
                    ast_ptr id , params;
                    params = pop_node();
                    id = pop_node();
                    ast_ptr n = new_node_ptr(FuncHeader, "FuncHeader", 0, 0);
                    push_back(&(n->children), &id);
                    push_back(&(n->children), &params);
                    push_back(&stack,&n);
                }
#line 1677 "y.tab.c"
    break;

  case 18:
#line 118 "gocompiler.y"
                                       {
                        ast_ptr par = pop_node(), funcPar = new_node_ptr(FuncParams, "FuncParams", 0, 0);
                        for(size_t i = 0; i< par->children.size/2; i++) {
                            ast_ptr p = new_node_ptr(ParamDecl, "ParamDecl", 0, 0);
                            push_back(&(p->children), get(&(par->children), 2*i));
                            push_back(&(p->children), get(&(par->children), 2*i+1));
                            push_back(&(funcPar->children), &p);
                        }
                        // free_ast_ptr(par);
                        push_back(&stack, &funcPar);
                    }
#line 1693 "y.tab.c"
    break;

  case 19:
#line 129 "gocompiler.y"
                            {push_node(FuncParams, "FuncParams", "", 0, 0);}
#line 1699 "y.tab.c"
    break;

  case 20:
#line 131 "gocompiler.y"
                                                          {push_with_children(Rep_Comma_Id, "", 3, 0, 0);}
#line 1705 "y.tab.c"
    break;

  case 21:
#line 132 "gocompiler.y"
                      {push_node(Rep_Comma_Id, "", "", 0, 0);}
#line 1711 "y.tab.c"
    break;

  case 22:
#line 134 "gocompiler.y"
                                             {
    ast_ptr rp = pop_node();
    if(rp->children.size > 0) {
        vector ch = flat_children(rp, 2, true);
        rp = new_node_ptr(ParamDecl, "ParamDecl", 0, 0);
        vector new_children = new_vector(sizeof(ast_ptr));
        ast_ptr type = pop_node();
        ast_ptr id = pop_node();
        push_back(&new_children, &type);
        push_back(&new_children, &id);
        for(size_t i =0; i< ch.size; i++) {
            push_back(&new_children, get(&(ch), i));
        }
        rp->children = new_children;
        free(ch.array);
        push_back(&stack, &rp);
    }
    else {
        // free_ast_ptr(rp);
        ast_ptr type = pop_node();
        ast_ptr id = pop_node();
        vector new_children = new_vector(sizeof(ast_ptr));
        push_back(&new_children, &type);
        push_back(&new_children, &id);
        ast_ptr n = new_node_ptr(ParamDecl, "ParamDecl", 0, 0);
        n->children = new_children;
        push_back(&stack, &n);
    }
}
#line 1745 "y.tab.c"
    break;

  case 23:
#line 163 "gocompiler.y"
                                           {
    ast_ptr rp = pop_node();
    if(rp->children.size == 0) {
        // free(rp);
        P_NODE(FuncBody, "", 0, 0);
    }
    else {
        ast_ptr node = new_node_ptr(FuncBody, "FuncBody", 0, 0);
        vector v = flat_children(rp, 1,0);
        for(size_t i = 0; i<v.size; i++)  {
            ast_ptr ch = *(ast_ptr*)get(&(v), i);
            if(ch->node_type == VarSpec) {
                vector w = ch->children;
                for(size_t i = 0; i<w.size; i++) {
                    ast_ptr s = *(ast_ptr*) get(&w, i);
                    push_back(&(node->children), &s);
                }
                // free_ast_ptr(ch);
            }
            else{ 
                push_back(&(node->children), &ch);
            }
        }
        free(v.array);
        push_back(&stack, &node);
    }
}
#line 1777 "y.tab.c"
    break;

  case 24:
#line 190 "gocompiler.y"
                                                                {push_with_children(Vars_Statements, "", 2, 0, 0);}
#line 1783 "y.tab.c"
    break;

  case 25:
#line 191 "gocompiler.y"
                                                             {push_with_children(Vars_Statements, "", 2, 0, 0);}
#line 1789 "y.tab.c"
    break;

  case 26:
#line 192 "gocompiler.y"
                      {push_node(Vars_Statements, "", "", 0, 0);}
#line 1795 "y.tab.c"
    break;

  case 28:
#line 195 "gocompiler.y"
                               {
    ast_ptr rp = pop_node();
    vector ch = flat_children(rp, 1,0);
    ast_ptr n = new_node_ptr(Block, "Block", 0, 0);
    n->children = ch;
    push_back(&stack, &n);
}
#line 1807 "y.tab.c"
    break;

  case 29:
#line 202 "gocompiler.y"
                                                                     {push_with_children(Rep_Statement_Semicolon, "", 2, 0, 0);}
#line 1813 "y.tab.c"
    break;

  case 30:
#line 203 "gocompiler.y"
                           {push_node(Rep_Statement_Semicolon, "", "", 0, 0);}
#line 1819 "y.tab.c"
    break;

  case 31:
#line 205 "gocompiler.y"
                                     {push_with_children(Assign, (yyvsp[-1].token_id)->id, 2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 1825 "y.tab.c"
    break;

  case 33:
#line 207 "gocompiler.y"
                                              {
                    ast_ptr bl = pop_node();
                    ast_ptr expr = pop_node();
                    ast_ptr n = new_node_ptr(If, "If", (yyvsp[-4].token_id)->line, (yyvsp[-4].token_id)->column);
                    ast_ptr b = new_node_ptr(Block, "Block", 0, 0);
                    vector v = new_vector(sizeof(ast_ptr));
                    push_back(&v, &expr);
                    push_back(&v, &bl);
                    push_back(&v, &b);
                    n->children = v;
                    push_back(&stack, &n);
                }
#line 1842 "y.tab.c"
    break;

  case 34:
#line 219 "gocompiler.y"
                                                                       {/*printf("If\n");*/ push_with_children(If, "If", 3, (yyvsp[-8].token_id)->line, (yyvsp[-8].token_id)->column);}
#line 1848 "y.tab.c"
    break;

  case 35:
#line 220 "gocompiler.y"
                                          {/*printf("For\n");*/ push_with_children(For, "For", 1, (yyvsp[-3].token_id)->line, (yyvsp[-3].token_id)->column);}
#line 1854 "y.tab.c"
    break;

  case 36:
#line 221 "gocompiler.y"
                                               {/*printf("For\n");*/ push_with_children(For, "For", 2, (yyvsp[-4].token_id)->line, (yyvsp[-4].token_id)->column);}
#line 1860 "y.tab.c"
    break;

  case 37:
#line 222 "gocompiler.y"
                         {/*printf("Return\n");*/push_node(Return, "Return", "", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column);}
#line 1866 "y.tab.c"
    break;

  case 38:
#line 223 "gocompiler.y"
                              {/*printf("Return\n");*/push_with_children(Return, "Return", 1, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 1872 "y.tab.c"
    break;

  case 41:
#line 226 "gocompiler.y"
                                       {/*printf("Print\n");*/push_with_children(Print, yytext, 1, (yyvsp[-3].token_id)->line, (yyvsp[-3].token_id)->line);}
#line 1878 "y.tab.c"
    break;

  case 42:
#line 227 "gocompiler.y"
                                               {/*printf("Print\n");*/push_with_children(Print, yytext, 1, (yyvsp[-3].token_id)->line, (yyvsp[-3].token_id)->column);}
#line 1884 "y.tab.c"
    break;

  case 43:
#line 228 "gocompiler.y"
                            {/* yyerrok; yyclearin; yyerror("syntax error");*/}
#line 1890 "y.tab.c"
    break;

  case 44:
#line 229 "gocompiler.y"
                                                                                  {/*printf("Parseargs\n");*/ push_with_children(ParseArgs, (yyvsp[-6].token_id)->id, 2, (yyvsp[-6].token_id)->line, (yyvsp[-6].token_id)->column);}
#line 1896 "y.tab.c"
    break;

  case 45:
#line 230 "gocompiler.y"
                                                                                          {/*yyerror("syntax error");*/}
#line 1902 "y.tab.c"
    break;

  case 46:
#line 231 "gocompiler.y"
                                          {push_with_children(Rep_Comma_Expr, "", 2, 0, 0);}
#line 1908 "y.tab.c"
    break;

  case 47:
#line 232 "gocompiler.y"
                  {push_node(Rep_Comma_Expr, "", "", 0, 0);}
#line 1914 "y.tab.c"
    break;

  case 48:
#line 234 "gocompiler.y"
                                                        {
                    ast_ptr rp = *(ast_ptr*)get(&stack, stack.size-1);
                    if(rp->children.size > 0) {
                        rp = pop_node();
                        vector ch = flat_children(rp, 1, false); //! rp was freed
                        rp = new_node_ptr(Call, "Call", 0, 0);
                        vector new_children = new_vector(sizeof(ast_ptr));
                        ast_ptr expr = pop_node();
                        ast_ptr id = pop_node();
                        push_back(&new_children, &id);
                        push_back(&new_children, &expr);
                        for(size_t i = 0; i<ch.size; i++) {
                            push_back(&new_children, get(&ch, i));
                        } 
                        free(ch.array);
                        rp->children = new_children;
                        push_back(&stack, &rp);
                    }
                    else {
                        pop_node();
                        // free_ast_ptr(rp);
                        push_with_children(Call, "Call", 2, 0, 0);
                    }
                }
#line 1943 "y.tab.c"
    break;

  case 49:
#line 258 "gocompiler.y"
                                     {push_with_children(Call,"Call", 1, 0, 0);}
#line 1949 "y.tab.c"
    break;

  case 50:
#line 259 "gocompiler.y"
                                               { }
#line 1955 "y.tab.c"
    break;

  case 51:
#line 261 "gocompiler.y"
               {
            push_node(IntLit, yytext,"", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column);
        }
#line 1963 "y.tab.c"
    break;

  case 52:
#line 264 "gocompiler.y"
                  {
            push_node(RealLit, yytext,"", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column);
            }
#line 1971 "y.tab.c"
    break;

  case 55:
#line 269 "gocompiler.y"
                        {;}
#line 1977 "y.tab.c"
    break;

  case 56:
#line 270 "gocompiler.y"
                    {/*printf("Not\n");*/push_with_children(Not, (yyvsp[-1].token_id)->id,1, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 1983 "y.tab.c"
    break;

  case 57:
#line 271 "gocompiler.y"
                      {/*printf("Minus\n");*/push_with_children(Minus, (yyvsp[-1].token_id)->id,1, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 1989 "y.tab.c"
    break;

  case 58:
#line 272 "gocompiler.y"
                     {/*printf("Plus\n");*/push_with_children(Plus, (yyvsp[-1].token_id)->id,1, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 1995 "y.tab.c"
    break;

  case 60:
#line 274 "gocompiler.y"
                         {/*printf("Mul\n");*/push_with_children(Mul, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2001 "y.tab.c"
    break;

  case 61:
#line 275 "gocompiler.y"
                          {/*printf("Div\n");*/push_with_children(Div, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2007 "y.tab.c"
    break;

  case 62:
#line 276 "gocompiler.y"
                          {/*printf("Mod\n");*/push_with_children(Mod, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2013 "y.tab.c"
    break;

  case 64:
#line 278 "gocompiler.y"
                         {/*printf("Plus\n");*/ push_with_children(Add, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2019 "y.tab.c"
    break;

  case 65:
#line 279 "gocompiler.y"
                            {/*printf("Minus\n");*/push_with_children(Sub, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2025 "y.tab.c"
    break;

  case 67:
#line 281 "gocompiler.y"
                       {/*printf("Lt\n");*/push_with_children(Lt, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2031 "y.tab.c"
    break;

  case 68:
#line 282 "gocompiler.y"
                         {/*printf("Gt\n");*/push_with_children(Gt, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2037 "y.tab.c"
    break;

  case 69:
#line 283 "gocompiler.y"
                         {/*printf("Eq\n");*/push_with_children(Eq, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2043 "y.tab.c"
    break;

  case 70:
#line 284 "gocompiler.y"
                          {/*printf("Ne\n");*/push_with_children(Ne, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2049 "y.tab.c"
    break;

  case 71:
#line 285 "gocompiler.y"
                          {/*printf("Le\n");*/push_with_children(Le, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2055 "y.tab.c"
    break;

  case 72:
#line 286 "gocompiler.y"
                         {/*printf("Ge\n");*/push_with_children(Ge, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2061 "y.tab.c"
    break;

  case 74:
#line 288 "gocompiler.y"
                        {/*printf("And\n");*/push_with_children(And, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2067 "y.tab.c"
    break;

  case 76:
#line 290 "gocompiler.y"
                      {/*printf("Or\n");*/push_with_children(Or, (yyvsp[-1].token_id)->id,2, (yyvsp[-1].token_id)->line, (yyvsp[-1].token_id)->column);}
#line 2073 "y.tab.c"
    break;

  case 78:
#line 293 "gocompiler.y"
             {
    push_node(Id, yytext,"", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column);
}
#line 2081 "y.tab.c"
    break;

  case 79:
#line 296 "gocompiler.y"
                     {
    push_node(StrLit, yytext,"", (yyvsp[0].token_id)->line, (yyvsp[0].token_id)->column);
}
#line 2089 "y.tab.c"
    break;

  case 80:
#line 299 "gocompiler.y"
                 {}
#line 2095 "y.tab.c"
    break;


#line 2099 "y.tab.c"

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
#line 300 "gocompiler.y"
