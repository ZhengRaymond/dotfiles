# Ray's dotfiles.

## Installation
_Follow as needed_
1. follow this [guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
2. `vim +PluginInstall +qall` 
3. Install brew
 * LinuxBrew: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"\n`
 * HomeBrew: `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
4. `brew install --HEAD universal-ctags/universal-ctags/universal-ctags\n`
5. cd into Etsyweb, then run `ctags -f php.tags --exclude="(htdocs.*)|node_modules|templates|vendor|translations|cron.d|build|docs|Shipping|Generated|.git|Atlas|Geonames|Controller|CustomShops|REST|Storefronts|Discovery|Search2" -R`
6. `brew install tmux`


## useful links:
- [Setting up dotfiles repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
- [Intro to tmux](https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340)
- [Search and replace](http://vim.wikia.com/wiki/Search_and_replace)
- [Normal mode commands](https://www.radford.edu/~mhtay/CPSC120/VIM_Editor_Commands.htm)
- [PHP for Vim](http://blog.joncairns.com/2012/05/using-vim-as-a-php-ide/)
- Some dotfiles:
 * [ronakg](https://github.com/ronakg/dotfiles)


## Ag.vim
`:Ag <search_term>` silver searches from project root, opens quickfix window. Once closed, this window's shortcuts don't work anymore...
```
e    to open file and close the quickfix window
o    to open (same as enter)
go   to preview file (open but maintain focus on ag.vim results)
t    to open in new tab
T    to open in new tab silently
h    to open in horizontal split
H    to open in horizontal split silently
v    to open in vertical split
gv   to open in vertical split silently
q    to close the quickfix window
```
`@@` repeats last macro command
`gt` goes to next tab
`gT` goest to previous tab
`{i}gt` goes to ith tab
`:tabclose` closes the current tab
`:copen` opens the the quickfix window
`:cclose` closes the quickfix window
