%%

%class function //The generated class is named function_java.java
%standalone  

num=(\-)?[0-9]+
float={num}.[0-9]+
integer={num}
operand={integer}|{float}
op= (add|minus|multi)"("{operand}","{operand}")"

%{
	public String removeLastChar(String str) {
        return str.substring(0,str.length()-1);
    }
	public float result(String input){
		//remove (,)
		String[] first_split=input.split("[(]");
		String new_str=removeLastChar(first_split[1]);
		String[] sec_split=new_str.split(",");

		// add number operand 1&2
		float operand1= Float.parseFloat(sec_split[0]);
		float operand2= Float.parseFloat(sec_split[1]);

		if (first_split[0].equals("add")){
			return operand1+operand2;
		}
		else if (first_split[0].equals("minus")){
			return operand1-operand2;
		}
		else {
			return operand1*operand2;
		}
	}
%}

%%

{op} { System.out.println( yytext() + "=" + result(yytext())  ); }
.* { System.out.println( yytext() + "= Invalid Input "); }
