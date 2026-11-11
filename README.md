**Member**  
**_Borin Powiney e20231335**  
**_Ly Nyheang e20230906**  
**_Be Mengseang e20230455**  
# SQL Query Scanner

## 1. Project Overview

The SQL Query Scanner is a Java-based lexical analyzer developed using JFlex. It reads SQL queries and breaks them into smaller meaningful units called **tokens**.

The scanner identifies SQL keywords, identifiers, data types, operators, punctuation, and unrecognized characters.

This project demonstrates the lexical analysis phase of compiler design.

## 2. Project Objectives

- Understand the concept of lexical analysis.
- Identify and classify SQL tokens.
- Use regular expressions to recognize different token patterns.
- Implement a lexical analyzer using JFlex.
- Detect unrecognized characters and report lexical errors.
- Display token information, including token type, lexeme, line, and column.

## 3. Technologies Used

- **Java 21** – Programming language.
- **JFlex 1.9.1** – Lexical analyzer generator.
- **Maven** – Project build and dependency management.
- **VS Code** – Development environment.

## 4. Project Structure

```text
SQL-Query-Scanner/
├── src/
│   └── main/
│       ├── java/
│       │   └── edu/itc/sqlscanner/
│       │       ├── Main.java
│       │       ├── Token.java
│       │       └── TokenType.java
│       └── jflex/
│           └── SQLScanner.flex
├── pom.xml
└── README.md
```

## 5. Supported Token Types

| Token Type | Description | Examples |
|---|---|---|
| KEYWORD | SQL reserved words | SELECT, FROM, WHERE |
| IDENTIFIER | Table and column names | students, product_name |
| INTEGER | Whole numbers | 10, 100 |
| DECIMAL | Decimal numbers | 99.99, 10.5 |
| STRING | Text inside single quotes | 'Apple', 'Hello' |
| OPERATOR | Comparison and arithmetic operators | =, >=, !=, + |
| PUNCTUATION | SQL punctuation symbols | , ; ( ) . |
| ERROR | Unrecognized characters | @, # |

## 6. Supported SQL Keywords

The scanner currently recognizes:

- SELECT
- FROM
- WHERE
- INSERT
- UPDATE
- DELETE
- INTO
- VALUES
- SET
- AND
- OR
- NOT
- ORDER
- BY
- GROUP
- HAVING
- JOIN
- ON

Keyword recognition is case-insensitive.

## 7. How the Scanner Works

1. The user provides an SQL query as input.
2. The scanner reads the input.
3. JFlex applies regular expressions to recognize token patterns.
4. Each recognized token is assigned a token type.
5. The scanner creates a Token object containing the token type, lexeme, line, and column.
6. The program displays the recognized tokens.
7. Unrecognized characters are returned as ERROR tokens.

## 8. Example SQL Input

```sql
SELECT product_name, price
FROM products
WHERE price >= 99.99
AND product_name != 'Apple';
```

## 9. Example Scanner Output

```text
===== SQL SCANNER TEST =====

KEYWORD              SELECT          Line: 1, Column: 1
IDENTIFIER           product_name    Line: 1, Column: 8
PUNCTUATION          ,               Line: 1, Column: 20
IDENTIFIER           price           Line: 1, Column: 22
KEYWORD              FROM            Line: 2, Column: 1
IDENTIFIER           products        Line: 2, Column: 6
KEYWORD              WHERE           Line: 3, Column: 1
IDENTIFIER           price           Line: 3, Column: 7
OPERATOR             >=              Line: 3, Column: 13
DECIMAL              99.99           Line: 3, Column: 16
KEYWORD              AND             Line: 4, Column: 1
IDENTIFIER           product_name    Line: 4, Column: 5
OPERATOR             !=              Line: 4, Column: 18
STRING               'Apple'         Line: 4, Column: 21
PUNCTUATION          ;               Line: 4, Column: 28

Scan completed successfully
```

*Note: This output illustrates the expected token classifications and positions.*

## 10. Installation and Execution

### Prerequisites

- Java Development Kit (JDK) 21
- Apache Maven
- JFlex 1.9.1

### Step 1: Clone the repository

```bash
git clone <repository-url>
```

### Step 2: Navigate to the project directory

```bash
cd SQL-Query-Scanner
```

### Step 3: Generate the Java scanner

```bash
mvn jflex:generate
```

Make sure the JFlex Maven plugin is configured in `pom.xml`.

### Step 4: Compile the project

```bash
mvn clean compile
```

### Step 5: Run the scanner

```bash
java -cp target/classes edu.itc.sqlscanner.Main
```

## 11. Error Detection

The scanner uses a fallback rule to identify characters that do not match any defined token pattern.

Example:

```sql
SELECT name @ FROM students;
```

The `@` character is not recognized by the current scanner rules, so it is returned as an ERROR token.

The program then displays:

```text
Scan completed with lexical errors
```

## 12. Limitations

- The scanner supports a defined set of SQL keywords.
- It performs lexical analysis, not complete SQL syntax validation.
- It does not verify whether tables or columns exist in a database.
- Some invalid SQL formats may be split into multiple tokens rather than reported as one specific error.
- Advanced SQL features and additional data types may require further development.

## 13. Future Improvements

- Support additional SQL keywords and data types.
- Improve detection of invalid numbers and unfinished string literals.
- Provide more detailed lexical error messages.
- Distinguish arithmetic operators from comparison operators.
- Add more test cases for different SQL statements.
- Improve support for complex SQL queries.

## 14. Conclusion

The SQL Query Scanner demonstrates how lexical analysis works by transforming SQL queries into meaningful tokens. Using Java and JFlex, the project identifies different SQL elements, classifies them into token categories, tracks their positions, and detects unrecognized characters.

This project provides a practical introduction to compiler design and the role of lexical analyzers in processing programming languages.
