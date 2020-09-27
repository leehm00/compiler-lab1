%option noyywrap
%{
/*****************声明和选项设置  begin*****************/
#include <stdio.h>
#include <stdlib.h>

#include "lexical_analyzer.h"


/*****************声明和选项设置  end*****************/

%}
 

%%

 /******************TODO*********************/
 /****请在此补全所有flex的模式与动作  start******/
 //STUDENT TO DO

. {return ERROR;} 




 /****请在此补全所有flex的模式与动作  end******/
%%
/****************C代码 start*************/

/// \brief analysize a *.cminus file
///
///	\param input_file
/// \param token stream

void analyzer(char* input_file, Token_Node* token_stream){
	if(!(yyin = fopen(input_file,"r"))){
		printf("[ERR] No input file\n");
		exit(1);
	}
	printf("[START]: Read from: %s\n", input_file);

	int token;
	int index = 0;

	while(token = yylex()){
		switch(token){
			case COMMENT: 
				//STUDENT TO DO
			case BLANK:
				//STUDENT TO DO	
				break;
			case EOL:
				//STUDENT TO DO
				break;
			case ERROR:
				printf("[ERR]: unable to analysize %s at %d line, from %d to %d\n", yytext, lines, pos_start, pos_end);
			default :
				if (token == ERROR){
					sprintf(token_stream[index].text, "[ERR]: unable to analysize %s at %d line, from %d to %d", yytext, lines, pos_start, pos_end);
				} else {
					strcpy(token_stream[index].text, yytext);
				}
				token_stream[index].token = token;
				token_stream[index].lines = lines;
				token_stream[index].pos_start = pos_start;
				token_stream[index].pos_end = pos_end;
				index++;
				if (index >= MAX_NUM_TOKEN_NODE){
					printf("%d has too many tokens (> %d)", input_file, MAX_NUM_TOKEN_NODE);
					exit(1);
				}
		}
	}
	printf("[END]: Analysis completed.\n");
	return;
}



/****************C代码 end*************/