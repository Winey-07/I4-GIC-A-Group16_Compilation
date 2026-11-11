package edu.itc.sqlscanner;

public enum TokenType {
    KEYWORD,
    IDENTIFIER,

    INTEGER,
    DECIMAL,
    STRING,

    OPERATOR,

    ARITHMETIC_OPERATOR,
    PUNCTUATION,
    LEXICAL_ERROR,

    COMMA,
    SEMICOLON,
    LPAREN,
    RPAREN,
    DOT,
    ERROR

}
