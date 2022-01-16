%%

%class email //The generated class is named email_Java.java
%standalone  

username = [[A-Za-z]|[0-9]]+
domain_name = "@"([A-Za-z]|[0-9])*
extension =(.ed|.kh|.com)
nemail={username}{domain_name} 
email={username}{domain_name}{extension}+


%%

{email} { System.out.println( "Correct: "+ yytext() );}
.* { System.out.println( "Incorrect: "+ yytext() );}

