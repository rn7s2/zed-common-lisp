(comment) @annotation
(block_comment) @annotation

(defun
  (defun_header
    keyword: (defun_keyword) @context
    function_name: (_) @name)) @item

(list_lit
  .
  (sym_lit) @_definition
  .
  [
    (sym_lit)
    (kwd_lit)
  ] @name
  (#match? @_definition "(?i)^(cl:)?(defvar|defparameter|defconstant|defstruct|defclass|define-condition|deftype|defpackage|in-package|define-symbol-macro)$")) @item
