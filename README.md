# .VIMRC
```
__     _____ __  __ ____   ____
\ \   / /_ _|  \/  |  _ \ / ___|
 \ \ / / | || |\/| | |_) | |
 _\ V /  | || |  | |  _ <| |___
(_)\_/  |___|_|  |_|_| \_\\____|
```
## Requirements
- Vim 8.0 or above
- git
- ctags/cscope

```
sudo apt install vim git curl ctags cscope
```
## Quick Start

1. Install Dein.vim.

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# Use `~/.vim/bundles` as installation directory
sh ./installer.sh ~/.vim/bundles
mkdir -p ~/.vim/swapfiles
```

2. Edit the ~/.vimrc.
```
curl https://raw.githubusercontent.com/huwan/vimrc/master/vimrc > ~/.vimrc
```
## Keyboard shortcuts
- `F2`: Trim trailing whitespace
- `F4`: generate ctags and cscope database
- `gcc`: comment out current line
- `ctrl` + `c`: find functions calling the function in cscope
- `,` + `n`: toggle (absolute) line numbers
- `,` + `r`: toggle relative line numbers
