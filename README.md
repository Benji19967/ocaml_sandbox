# OCAML

## Installation

https://ocaml.org/docs/installing-ocaml

```bash
brew install opam
brew install curl # this was necessary for me, otherwise `opam init -y' would fail
opam init -y
eval $(opam env)
```

This was the installation error before running `brew install curl`:
```
ERROR] Could not update repository "default": OpamDownload.Download_fail(_, "Download command failed: \"/opt/homebrew/bin/wget --content-disposition -t 3 -O                  
        /private/var/folders/mh/c04y3vl579x3rvgfx36xl89h0000gn/T/opam-77907-4f4e41/index.tar.gz.part -U opam/2.1.5 -- https://opam.ocaml.org/index.tar.gz\" exited with code
        256")                                                                                                                                                                  
[ERROR] Initial download of repository failed.
```

`opam switch` should now display something similar to:

```bash
#  switch   compiler     description
→  default  ocaml.5.1.1  default
```

### Installing `dune`

```bash
opam update
opam upgrade dune
```

## Hello World

https://ocaml.org/docs/your-first-program

```bash
dune init proj hello
dune build
dune exec hello
```

### Watch mode

This will monitor filesystem changes and update the build/binary immediately.

```bash
dune build -w # or
dune exec hello -w
```

## Language Server

```bash
opam install ocaml-lsp-server
```

- In Neovim: `:Mason`, add `ocamllsp`
- add "ocamllsp" to mason.lua in neovim config files
