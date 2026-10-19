# zed-bdl

[BDL (Business Development Language)](https://4js.com/online_documentation/fjs-fgl-2.50.02-manual-html/index.html) support for [Zed](https://github.com/zed-industries/zed).

BDL is the language used by [Four Js Genero](https://4js.com/) (and its ancestor Informix-4GL) to build business applications. This extension adds syntax highlighting, outline, bracket matching, and comment support for BDL/4GL sources.

## Features

- Syntax highlighting via the [`tree-sitter-bdl`](https://github.com/darcyjoven/tree-sitter-bdl) grammar, including embedded static SQL.
- Document outline for `FUNCTION`, `REPORT`, `DISPLAY`, `MENU`, `INPUT`, `CONSTRUCT`, and `DIALOG` blocks.
- Bracket matching and auto-closing for `()`, `[]`, `{}`, and strings.
- Line comments (`--`, `#`) and block comments (`{ ... }`).

## Installation

You can install this extension as a [dev extension](https://zed.dev/docs/extensions/developing-extensions) until it is available from the official registry:

1. Clone this repository:

   ```sh
   git clone https://github.com/darcyjoven/bdl.git
   ```

2. Open Zed, run the command palette (`ctrl-shift-p` / `cmd-shift-p`), and select `zed: install dev extension`.

3. Pick the cloned `bdl` directory.

Files with the `.4gl` or `.global` suffix are then opened with BDL highlighting.

## License

[MIT](LICENSE)
