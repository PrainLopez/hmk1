typedef enum {
    L_SUB, R_SUB, 
    NOT, ADDRESS, MULTIPLY, DIVIDE, PLUS, MINUS, 
    L_PAR, R_PAR,
    L_CUR, R_CUR,
    LT, LT_EQ, RT, RT_EQ,
    EQUAL, NOT_EQ, AND ,OR,
    ASSIGN, COMMA, SEMI,
    VOID, CHAR, INTEGER, NUMBER, STRING, BOOLEAN, TERM, ANY,
    TRUE_T, FALSE_T, EMPTY,
    WHILE, IF, ELSE, RETURN, DECLARE, RULE, VAR,
    EXPORT, IMPORT,
    ID, INT_C, NUM_C, STR_C
} TokenType;

static char* token_str[] = {
    "LSUB", "RSUB",
    "NOT", "ADDR", "MULT", "DIVI", "PLUS", "MINUS", 
    "LPAR", "RPAR",
    "LCUR", "RCUR",
    "LT", "LTEQ", "RT", "RTEQ",
    "EQ", "NOTEQ", "AND" ,"OR",
    "ASSIGN", "COMMA", "SEMI",
    "VOID", "CHAR", "INT", "NUM", "STR", "BOOL", "TERM", "ANY",
    "TRUE", "FALSE", "EMPTY",
    "WHILE", "IF", "ELSE", "RETURN", "DECL", "RULE", "VAR",
    "EXPORT", "IMPORT",
    "ID", "INTC", "NUMC", "STRC"
};

static char* error_str[] = {
    "Invalid character."
}