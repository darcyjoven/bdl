(function
  name: (identifier) @name) @item

(call
  name: (variable
    (identifier) @name
    (#not-match? @name "^(?i)(cl_|s_|fgl_)")
  )
) @item

(display
  fields: (identifier) @name) @item

(menu
    title:(_) @name) @item

(input) @item

(construct
    value:(_) @name) @item
(dialog)@item

(branch
    action: (identifier) @name) @item

(branch
    action: (string) @name) @item