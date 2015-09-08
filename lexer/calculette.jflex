import java_cup.runtime.*;

%%
%class CalculetteLexer
%line
%column
%cupsym CalculetteSymbol
%cup

%{
private Symbol symbol (int type) {
        return new Symbol (type, yyline, yycolumn);
}

private Symbol symbol (int type, Object value) {
        return new Symbol (type, yyline, yycolumn, value);
}
%}

id      = [a-zA-Z][a-zA-Z0-9_]*
nb      = 0|[1-9][0-9]*

%%

/* -------------------------------------------------
        Separateurs Operateurs
   ------------------------------------------------- */

"("      { return symbol(CalculetteSymbol.LPAR); }
")"      { return symbol(CalculetteSymbol.RPAR); }
"+"    { return symbol(CalculetteSymbol.PLUS); }
"*"      { return symbol(CalculetteSymbol.MULT); }
";"      { return symbol(CalculetteSymbol.SEMIC); }

/* -------------------------------------------------
        Variables, Entiers
   ------------------------------------------------- */


{id}     { return symbol(CalculetteSymbol.ID); }
 /* -------------------------------------------------
        Caracteres non pris en compte
   ------------------------------------------------- */

[\t|\n|\r|\r\n]                  {}

/* -------------------------------------------------
        Erreurs
   ------------------------------------------------- */
. {}
