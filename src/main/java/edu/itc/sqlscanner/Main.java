package edu.itc.sqlscanner;

import java.io.IOException;
import java.io.StringReader;

public class Main {

    public static void main(String[] args) throws IOException {

        String sql = """
          SELECT 'Hello FROM products;
SELECT "Database FROM products;
            """;

        SQLScanner scanner = new SQLScanner(new StringReader(sql));

        Token token;
        boolean hasError = false;

        System.out.println("===== SQL SCANNER TEST =====");

             while ((token = scanner.yylex()) != null) {
            System.out.println(token);

            if(token.getType()== TokenType.LEXICAL_ERROR){
                hasError = true;
            }
        }
        if(hasError){
            System.out.println("\nScan completed with lexical errors");
        }else{
            System.out.println("\nScan completed successfully");
          
    }


 }
}
