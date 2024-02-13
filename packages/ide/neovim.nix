{ neovim, vimPlugins, vimUtils, fetchFromGitHub, universal-ctags, ... }: let

  plugins = let
    plug = pname: version: src: vimUtils.buildVimPlugin { inherit pname version src; };
    gh = owner: repo: rev: sha256: fetchFromGitHub { inherit owner repo rev sha256; };
  in with vimPlugins; [
    /*editing features*/
    #syntastic    # https://github.com/vim-syntastic/syntastic
    nerdcommenter # https://github.com/preservim/nerdcommenter
    tagbar
    ale
    #coc-nvim
    #coc-rls
    #coc-tsserver
    /*environment features*/
    #nerdtree
    #vim-nerdtree-tabs
    #vim-tmux
    #vim-tmux-navigator
    bufexplorer
    airline

    (plug "feline-nvim" "1.0.0" (gh
      "freddiehaddad" "feline.nvim" "f3df3b3d8aee86ea47cc0b2ba9e4c0094bb45ef8"
      "sha256-LrWuSWbmXoLzZMhmPkyg5Ug9TRBgPMWFHc2LoFfbJqU="))
    (plug "nvim-tree-lua" "2023-03-12" (gh
      "nvim-tree" "nvim-tree.lua" "bbb6d4891009de7dab05ad8fc2d39f272d7a751c"
      "sha256-Y5NRrlhRvaF+oip7cq9B97lXwF9CjDAgqlrrr+mT/Kg="))
    (plug "tabby-nvim" "2.1.2" (gh
      "nanozuki" "tabby.nvim" "9065c65138b59ea8182024216a5bbcf0d77baebb"
      "sha256-ddvT5lBLFWJnms4P+7Au1Bbou6mar0Eni+IgQQV4z0k="))

    /*languages*/
    (vimPlugins.nvim-treesitter.withPlugins (_: vimPlugins.nvim-treesitter.all))
    tabular
    vim-markdown
    rust-vim
    vim-nix
    vim-vue
    vim-pug
    vim-toml
    vim-glsl
    plantuml-syntax
    (plug "vim-stylus" "2020-01-21" (gh
      "iloginow" "vim-stylus" "0e457b09db55d3518703bb22e1555872c5c44b7a"
      "1z00bpxf1ph4iwj8xzbqn69sigw1frs889wfv9f5z4391ss1ynyy"))
    (plug "cypher-vim-syntax" "2020-01-21" (gh
      "neo4j-contrib" "cypher-vim-syntax" "b5ed38bce0dc667fc257d89ac0f44f89435223ab"
      "0fwzgxbc19x723a9x9l3nqx24lhc4nl7fidc8mcxvgpkhxfdm5h5"))
    (plug "vim-solidity" "2020-12-13" (gh
      "tomlion" "vim-solidity" "569bbbedc3898236d5912fed0caf114936112ae4"
      "1qpfbbrm4gjgvbkimhpxyl4fsdqkyw4raf17nw0ibqillz2d3pxx"))
    zig-vim
    nim-vim

    /*themes*/
    gruvbox
    (plug "vacme" "2023-03-12" (gh
      "olivertaylor" "vacme" "2f0b284b5bc1c9dd5b7f0b89ac880959e61b0be4"
      "sha256-eea0Ntr3gCmF6iZ0adZaVswWH70K9IJZ4SAyVSdFp3E="))
    nord-nvim
    (plug "nightfox-nvim" "2023-03-12" (gh
      "EdenEast" "nightfox.nvim" "a8044b084e0114609ec2c59cc4fa94c709a457d4"
      "sha256-o7v6hV99qbTacdJ8FvHaGCDkH9L9ERBHcyI6Cv/8ul0="))
    (plug "everforest" "2023-03-12" (gh
      "sainnhe" "everforest" "164a44fe8655ff66073189bf6b0a718bfaffa0c0"
      "sha256-9D1mS2GUgZ23EvPTsjUh7g508RZIguvuxcLg7IDSwqY="))
  ];

  configure = {
    customRC = ''
      ${builtins.readFile ./init.nvim}
      luafile ${./init.lua}
    '';
    packages.myPlugins = with vimPlugins; { start = plugins; opt = []; };
  };

in {
  name = "hackbg-arsenal-neovim";
  paths = [
    (neovim.override { inherit configure; vimAlias = true; })
    universal-ctags # needed by tagbar plugin
  ];
}
