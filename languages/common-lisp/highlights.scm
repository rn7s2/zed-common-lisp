; Comments and discarded forms
(comment) @comment
(block_comment) @comment
(dis_expr) @comment

; General symbols. More specific captures below take precedence.
(sym_lit) @variable

; Literals
(str_lit) @string
(format_specifier) @string.escape
(num_lit) @number
(complex_num_lit) @number
(char_lit) @string.special
(path_lit) @string.special
(fancy_literal) @string.special.symbol
(kwd_lit) @string.special.symbol
(self_referential_reader_macro) @string.special.symbol
(nil_lit) @constant.builtin

((sym_lit) @boolean
  (#match? @boolean "(?i)^t$"))

((sym_lit) @variable.special
  (#match? @variable.special "^\\*[^*]+\\*$"))

((sym_lit) @constant
  (#match? @constant "^\\+[^+]+\\+$"))

; Package-qualified symbols
(package_lit
  package: (_) @type)

; Calls and definitions. Keep the special-form captures below this section so
; keywords take precedence over the broad call-head rule.
(list_lit . (sym_lit) @function)
(list_lit .
  (package_lit
    symbol: (sym_lit) @function))

(defun_header
  keyword: (defun_keyword) @keyword
  function_name: (_) @function)

(defun_header
  specifier: (sym_lit) @type)

; Lambda-list variables, including destructured and optional parameters.
(defun_header
  lambda_list: (list_lit (sym_lit) @variable.parameter))

(defun_header
  lambda_list: (list_lit
    (list_lit . (sym_lit) @variable.parameter)))

; Common Lisp special operators and defining forms not specialized by the grammar
((sym_lit) @keyword
  (#match? @keyword "(?i)^(block|catch|declare|eval-when|flet|function|go|if|labels|let|let\\*|load-time-value|locally|macrolet|multiple-value-call|multiple-value-prog1|progn|progv|quote|return-from|setq|symbol-macrolet|tagbody|the|throw|unwind-protect|defclass|defconstant|defgeneric|defmacro|defmethod|defpackage|defparameter|defstruct|deftype|defun|defvar|define-condition|define-method-combination|define-modify-macro|define-setf-expander|define-symbol-macro|handler-bind|handler-case|in-package|lambda|multiple-value-bind|restart-bind|restart-case|typecase|etypecase|ctypecase|when|unless|cond|case|ecase|ccase|do|do\\*|dolist|dotimes|loop)$"))

; Lambda-list keywords
((sym_lit) @keyword
  (#match? @keyword "(?i)^&(allow-other-keys|aux|body|environment|key|optional|rest|whole)$"))

; LOOP's grammar-specific clauses
[
  (accumulation_verb)
  (for_clause_word)
  "loop"
  "for"
  "and"
  "do"
  "with"
  "in"
  "from"
  "to"
  "below"
  "above"
  "by"
  "then"
  "while"
  "until"
  "repeat"
  "finally"
  "initially"
  "return"
  "when"
  "unless"
  "if"
  "else"
  "thereis"
  "always"
  "never"
  "into"
  "as"
] @keyword

; Reader syntax and quoting
[
  "'"
  "`"
  ","
  ",@"
  "#'"
] @operator

[
  "#+"
  "#-"
] @preproc

; Structural punctuation. Actual nesting colors come from brackets.scm and the
; active Zed theme's contrast-adjusted accent palette.
[
  "("
  ")"
  "{"
  "}"
] @punctuation.bracket

[
  "."
  ":"
  "::"
] @punctuation.special
