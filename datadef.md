# AST DATA FORMATS
All ASTs are stored as characters in a buffer with a fixed size of 50 characters.
This documentation details the data layout for every ExprC within this buffer.

### General Rule of Thumb:
    **Numbers** - Stored as 10 characters: PIC S9(5)V99999
        Numbers are signed and contain 5 decimal places.
    **Strings** - Stored as 10 characters: PIC X(10)

## NumC
Input Type: `'N'`

Attributes:
- `value` (Size 10)

## IdC
Input Type: `'I'`

Attributes:
- `sym` (Size 10)

## StrC
Input Type: `'S'`

Attributes:
- `string` (Size 10)

## IfC
Input Type: `'If'`

Attributes:
- `test` (Size 10)
- `then` (Size 10)
- `else` (Size 10)

## LamC (Work-in-Progress)
Attributes:
- `parameters` (???)
- `body` (???)

## AppC
Input Type: `'A'`

Attributes:
- `name` (Size 10)
- `args` (Size 10n, n <= 4 and n is the no. of args)