{ pkgs ? import <nixpkgs> {} }: let

  neovimWithPlugins = let

    plugins = with pkgs.vimPlugins; [
      nerdcommenter
      nerdtree
      rust-vim
      syntastic
      tagbar
      vim-markdown
      vim-nerdtree-tabs
      vim-nix
      vim-pug
      vim-tmux
      vim-tmux-navigator
      vim-toml
    ];

    extraPlugins = let
      plugin = pname: version: src:
        (pkgs.vimUtils.buildVimPluginFrom2Nix { inherit pname version src; });
    in [
      (plugin "vim-stylus" "2020-01-21" (pkgs.fetchFromGitHub {
        owner  = "iloginow";
        repo   = "vim-stylus";
        rev    = "0e457b09db55d3518703bb22e1555872c5c44b7a";
        sha256 = "1z00bpxf1ph4iwj8xzbqn69sigw1frs889wfv9f5z4391ss1ynyy"; 
      }))
      (plugin "cypher-vim-syntax" "2020-01-21" (pkgs.fetchFromGitHub {
        owner  = "neo4j-contrib";
        repo   = "cypher-vim-syntax";
        rev    = "b5ed38bce0dc667fc257d89ac0f44f89435223ab";
        sha256 = "0fwzgxbc19x723a9x9l3nqx24lhc4nl7fidc8mcxvgpkhxfdm5h5"; 
      }))
      (plugin "vim-solidity" "2020-12-13" (pkgs.fetchFromGitHub {
        owner  = "tomlion";
        repo   = "vim-solidity";
        rev    = "569bbbedc3898236d5912fed0caf114936112ae4";
        sha256 = "1qpfbbrm4gjgvbkimhpxyl4fsdqkyw4raf17nw0ibqillz2d3pxx"; 
      }))
    ];

  in (pkgs.neovim.override {
    vimAlias = true;
    configure = {
      customRC = ''
        " set ttymouse=sgr
        set noswapfile
        set backspace=indent,eol,start mouse=a
        set nowrap ts=2 sts=2 sw=2 et ai cc=80 foldcolumn=0
        set fillchars+=vert:│
        set splitbelow splitright
        map ; :
        map <Leader><Tab> :NERDTreeToggle<CR>
        map <Leader>' :TagbarToggle<CR>
        map <Leader>h :nohl<cr>
        map <C-_> :Commentary<CR>
        map <C-s> :w<CR>

        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list = 0
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 0
      '';
      packages.myPlugins = with pkgs.vimPlugins; {
        start = plugins ++ extraPlugins;
        opt = [];
      };
    };
  });

in pkgs.mkShell {

  buildInputs = with pkgs; [
    neo-cowsay
    fortune
    git
    tig
    yarn
    ripgrep

    neovimWithPlugins

    nodejs-14_x
    yarn
  ];

  shellHook = ''
    fortune | cowsay
  '';
}
