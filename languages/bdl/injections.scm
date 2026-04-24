; 在你的 BDL 语法树中找到 sql_body 节点
(sql_body) @content

; 强制将该节点内部的内容标记为 sql 语言
(#set! injection.language "sql")
