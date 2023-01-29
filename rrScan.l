%{
#include "rrScan.h"
%}

%x COMMENT
%X COMMENT_S

%%
"["     {return L_SUB;}
"]"     {return R_SUB;}

"!"     {return NOT;}
"&"     {return ADDRESS;}
"*"     {return MULTIPLY;}
"/"     {return DIVIDE;}
"+"     {return PLUS;}
"-"     {return MINUS;}

"("     {return L_PAR;}
")"     {return R_PAR;}

"{"     {return L_CUR;}
"}"     {return R_CUR;}

"<"     {return LT;}
"<="    {return LT_EQ;}
">"     {return RT;}
">="    {return RT_EQ;}

"=="    {return EQUAL;}
"!="    {return NOT_EQ;}
"&&"    {return AND;}
"||"    {return OR;}

"="     {return ASSIGN;}
","     {return COMMA;}
";"     {return SEMI;}

"void"      {return VOID;}
"char"      {return CHAR;}
"int"       {return INTEGER;}
"num"       {return NUMBER;}
"str"       {return STRING;}
"bool"      {return BOOLEAN;}
"tm"        {return TERM;}
"any"       {return ANY;}

"true"      {return TRUE_T;}
"false"     {return FALSE_T;}
"ep"        {return EMPTY;}

"while"     {return WHILE;}
"if"        {return IF;}
"else"      {return ELSE;}
"return"    {return RETURN;}
"decl"      {return DECLARE;}
"rule"      {return RULE;}
"var"       {return VAR;}

"export"    {return EXPORT;}
"import"    {return IMPORT;}

[_a-zA-Z][_0-9a-zA-Z]*              {return ID;}
[0-9]+                              {return INT_C;} // 识别整数
[0-9]+.?[0-9]*([eE][+-]?[0-9]+)?    {return NUM_C;} // 识别小数
[0-9]+([eE][+-]?[0-9]+)?            {return NUM_C;} // 识别科学计数法
\"[^"]*\"                           {return STR_C;} // 识别字符串

"/*"				    {BEGIN(COMMENT);}
<COMMENT>"*/"		    {BEGIN(INITIAL);}
<COMMENT>([^*]|\n)+|.   {}

"//"                    {BEGIN(COMMENT_S);}
<COMMENT_S>"\n"         {BEGIN(INITIAL);}
<COMMENT_S>.            {}

[ \t\n] {} //还有\n
<<EOF>> {return 0;}

%%

void scannerError(int errCode){
    char* errMsg = error_str[errCode-1];
    printf("Error %d: %s\n", errCode, errMsg);
}

int main(int argc, char* argv[]) {
    int token;

    FILE *sourceFile;
    if((sourceFile = fopen(argv[1], "r")) == NULL) {
        printf("File open error.");
        
        return -1;
    }

    yyin = sourceFile;
    yylex();
    
    while ((token = yylex())>0) {
        printf("%s\t%s\n", token_str[token], yytext);
    }
    if (token<0){
        scannerError(abs(token));
        return token;
    }

    return 0;

    fclose(sourceFile);
}

int yywrap() {
    return 1;
}