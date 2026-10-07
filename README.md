# Common Lisp for Zed

Common Lisp language support for [Zed](https://zed.dev/), powered by [tree-sitter-commonlisp](https://github.com/tree-sitter-grammars/tree-sitter-commonlisp).

## Features

- Syntax highlighting for definitions, special operators, lambda lists, LOOP clauses, reader syntax, package-qualified symbols, strings, numbers, characters, pathnames, and comments
- Parenthesis and set-literal matching
- Theme-aware rainbow brackets
- Automatic indentation and bracket insertion
- Outline entries for packages, functions, and macros
- Support for `.lisp`, `.lsp`, `.cl`, and `.asd` files

## Installation

Until the extension is available in Zed's extension registry, install it from a local checkout:

1. Clone this repository.
2. Open Zed's Extensions page.
3. Select **Install Dev Extension**.
4. Choose the cloned repository.

## Rainbow brackets

The extension identifies nested bracket pairs through its Tree-sitter query. Zed supplies the colors from the active theme, so bracket colors adapt to both light and dark themes.

Rainbow brackets are disabled by default in Zed. Enable them in your settings:

```json
{
  "colorize_brackets": true
}
```

## Current scope

This extension provides language detection, highlighting, indentation, bracket handling, and outlines. It does not currently include a Common Lisp language server or debugger.

## License

[MIT](LICENSE)
