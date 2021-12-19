/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

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

#line 151 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
