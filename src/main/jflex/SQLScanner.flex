
package edu.itc.sqlscanner;

%%

%public
%class SQLScanner
%unicode
%line
%column
%type Token
%ignorecase

/* =====================================
   REGULAR EXPRESSION DEFINITIONS
   ===================================== */

Identifier = [a-zA-Z_][a-zA-Z0-9_]*
Digit = [0-9]
Integer = {Digit}+
Decimal = {Digit}+"."{Digit}+

StringLiteral = \'([^\'\\]|\\.)*\'

%%

/* =====================================
   1. IGNORE WHITESPACE
   ===================================== */

[ \t\r\n]+ {
    // Skip whitespace
}

/* =====================================
   2. SQL KEYWORDS 
   ===================================== */

"SELECT"  { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"FROM"    { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"WHERE"   { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"INSERT"  { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"UPDATE"  { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"DELETE"  { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"INTO"    { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"VALUES"  { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"SET"     { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"AND"     { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"OR"      { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"NOT"     { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"ORDER"   { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"BY"      { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"GROUP"   { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"HAVING"  { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"JOIN"    { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }
"ON"      { return new Token(TokenType.KEYWORD, yytext(), yyline + 1, yycolumn + 1); }

/* =====================================
   3. DATA TYPES 
   ===================================== */

/* String literals */

{StringLiteral} {
    return new Token(TokenType.STRING, yytext(), yyline + 1, yycolumn + 1);
}

/* Decimal numbers */

{Decimal} {
    return new Token(TokenType.DECIMAL, yytext(), yyline + 1, yycolumn + 1);
}

/* Integer numbers */

{Integer} {
    return new Token(TokenType.INTEGER, yytext(), yyline + 1, yycolumn + 1);
}

/* =====================================
   
   ===================================== */

/* Multi-character operators */

">=" | "<=" | "!=" | "<>" {
    return new Token(TokenType.OPERATOR, yytext(), yyline + 1, yycolumn + 1);
}

/* Single-character operators */

[=<>+*/%-] {
    return new Token(TokenType.OPERATOR, yytext(), yyline + 1, yycolumn + 1);
}

/* =====================================
   5. PUNCTUATION 
   ===================================== */

/* Comma, semicolon, parentheses */

[(),;.] {
    return new Token(TokenType.PUNCTUATION, yytext(), yyline + 1, yycolumn + 1);
}

/* =====================================
   6. IDENTIFIERS
   ===================================== */

{Identifier} {
    return new Token(TokenType.IDENTIFIER, yytext(), yyline + 1, yycolumn + 1);
}

/* =====================================
   7. ERROR DETECTION - WINEY
   ===================================== */

/* Any unrecognized character */


. {
    return new Token(TokenType.ERROR, yytext(), yyline + 1, yycolumn + 1);
}

/* End of input */

<<EOF>> {
    return null;
}
