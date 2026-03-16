; 布尔值
(boolean) @boolean

; 备注
(comment) @comment

; 常量
(constant
  const: (identifier) @constant)

(buildin)@constant.builtin

(function
    name:(identifier) @function)

(label
    name:(identifier) @label)

; 数字
(number) @number

(string) @string

; 操作符号
[
    "+"
    "-"
    "*"
    "/"
    ">"
    "<"
    "="
    ":"
    "|"
] @operator

;预处理器指令
(preproc) @preproc

;属性
(object
    property:(identifier) @property)

[
    "("
    ")"
] @punctuation.bracket

[
    "["
    "]"
] @punctuation.bracket


; 类型
;(types) @type
(basic) @type.builtin
(record
    table:(identifier) @type)
(like
    table:(identifier) @type)
(like
    column:(identifier) @type)

; 变量
(variable)@variable

; parameter
(report
    params:(_) @variable.parameter)
(call 
    params:(_) @variable.parameter)
(function
    params:(_) @variable.parameter)
[
    "IMPORT"
    "DATABASE"
    "GLOBALS"
    "TYPE"
    "DEFINE"
    "FOREACH"
    "LET"
    "END"
    "CONSTANT"
    "RETURN"
    "RETURNING"
    "CASE"
    "WHEN"
    "GOTO"
    "LABEL"
    "SELECT"
    "UPDATE"
    "DELETE"
    "INSERT"
    "UNLOAD"
    "LOAD"
    "FETCH"
    "DECLARE"
    "PUT"
    "EXECUTE"
    "USING"
    "INTO"
    "FLUSH"
    "CURSOR"
    "CALL"
    "CLOSE"
    "DIALOG"
    "DISPLAY"
    "INPUT"
    "CONSTRUCT"
    "MENU"
    "PROMPT"
    "ACTION"
    "OR"
    "AND"
    "NOT"
    "LIKE"
    "MAIN"
    "END"
    "FUNCTION"
    "OPTIONS"
    "WHENEVER"
    "TRY"
    "CATCH"
    "IF"
    "FOR"
    "THEN"
    "ELSE"
    "MESSAGE"
    "CREATE"
    "ALTER"
    "DROP"
    "ON"
    "BEFORE"
    "AFTER"
    "ROW"
    "FIELD"
    "CHANGE"
    "ACCEPT"
    "CANCEL"
    "CLEAR"
    "PREPARE"
    "FROM"
    "EXIT"
    "CONTINUE"
    "ARRAY"
    "DYNAMIC"
    "ATTRIBUTE"
    "ATTRIBUTES"
    "WITHOUT"
    "DEFAULTS"
    "APPEND"
    "TO"
    "STEP"
]@keyword