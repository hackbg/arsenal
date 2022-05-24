{ neovim, vimPlugins, vimUtils,
  fetchFromGitHub, universal-ctags, ... }:
let
  plug = pname: version: src:
    vimUtils.buildVimPluginFrom2Nix {
      inherit pname version src; };
  gh   = owner: repo: rev: sha256:
    fetchFromGitHub {
      inherit owner repo rev sha256; };
  stylus = (plug "vim-stylus" "2020-01-21" (gh
    "iloginow" "vim-stylus"
    "0e457b09db55d3518703bb22e1555872c5c44b7a"
    "1z00bpxf1ph4iwj8xzbqn69sigw1frs889wfv9f5z4391ss1ynyy"));
  cypher = (plug "cypher-vim-syntax" "2020-01-21" (gh
    "neo4j-contrib" "cypher-vim-syntax"
    "b5ed38bce0dc667fc257d89ac0f44f89435223ab"
    "0fwzgxbc19x723a9x9l3nqx24lhc4nl7fidc8mcxvgpkhxfdm5h5"));
  solidity = (plug "vim-solidity" "2020-12-13" (gh
    "tomlion" "vim-solidity"
    "569bbbedc3898236d5912fed0caf114936112ae4"
    "1qpfbbrm4gjgvbkimhpxyl4fsdqkyw4raf17nw0ibqillz2d3pxx"));
  acme = (plug "acme-colors" "2021-01-12" (gh
    "plan9-for-vimspace" "acme-colors"
    "de3c6963339114bea7ab61cc02522885d5809b44"
    "0fr4dh95c32hqwk0zfza2fx949x3s7rgigb7f6g0y31njv957dr3"));
  plugins = with vimPlugins; [
    /*editing features*/
    #syntastic     # https://github.com/vim-syntastic/syntastic
    nerdcommenter # https://github.com/preservim/nerdcommenter
    tagbar ale #coc-nvim coc-rls coc-tsserver
    /*environment features*/
    nerdtree vim-nerdtree-tabs
    vim-tmux vim-tmux-navigator
    bufexplorer airline
    /*languages*/
    tabular vim-markdown rust-vim vim-nix vim-vue
    vim-pug vim-toml vim-glsl plantuml-syntax
    stylus cypher solidity yats-vim
    /*themes*/
    gruvbox acme nord-nvim
  ];
in {
  name = "hackbg-arsenal-neovim";
  paths = [
    universal-ctags
    (neovim.override {
      vimAlias = true;
      configure = {
        customRC = builtins.readFile ./init.vim;
        packages.myPlugins = with vimPlugins; { start = plugins; opt = []; };
      };
    })
  ];
}
