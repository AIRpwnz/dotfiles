; "{%" @punctuation.bracket
; "%}" @punctuation.bracket
; "{{" @punctuation.bracket
; "}}" @punctuation.bracket
; "{#" @comment
; "#}" @comment

; "for" @keyword.control
; "in" @keyword.operator
; "if" @keyword.control
; "else" @keyword.control
; "elif" @keyword.control
; "endif" @keyword.control
; "endfor" @keyword.control

; (expression) @variable.other.member

; (keyword) @keyword
; (statement) @keyword
; (comment) @comment

(expression) @string
(statement) @variable.builtin
(keyword) @keyword
(comment) @comment
(identifier) @variable.parameter
(operator) @operator
(string) @string
