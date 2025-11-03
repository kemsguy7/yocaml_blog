name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup OCaml
        uses: ocaml/setup-ocaml@v3
        with:
          ocaml-compiler: "5.3.0"
          dune-cache: true
      
      - name: Install hilite first (workaround for yocaml_markdown bug)
        run: opam install hilite --yes
      
      - name: Install dependencies
        run: opam install . --deps-only --yes
      
      - name: Build project
        run: opam exec -- dune build --profile=release
      
      - name: Generate site
        run: opam exec -- dune exec joy_blog
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_www
          publish_branch: gh-pages