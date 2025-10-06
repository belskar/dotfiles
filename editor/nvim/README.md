## Dependencies to install

<https://formulae.brew.sh/formula/fd>

```shell
brew install fd
```

## Other options to set

**Left Option key as Meta in Iterm2.**
Preferences > Profiles > Keys > Set "Left Option key" as "Esc+".

## Shortcuts exploring

### TODOs

- disable delete to do indent left
- marks and jumping

### LazyVim shortcuts

`<S-h>, <S-l>` - prev, next buffer
`<C-s>` - save file

Shortcuts that I use, discovered by doing regular stuff on the go.

### Moving around project

`<leader>ff` - find files
`<leader>fg` - grep files
`<leader>fb` - find buffers
`<leader>fr` - find last opened files
`<C-v>` - open in vertical split
`<C-s>` - open horizontal split

### lsp stuff - errors diagnostics

`[d`, `]d` - jump to prev/next diagnostic
`<leader>cd` - open diagnostic float
`K` - hover with docs info
`<leader>cr` - rename symbol
`<leader>ss` - search symbol
`<leader>sS` - search symbol in workspace

#### jumping through definitions

`gd` - got to definition (lsp)
`gr` - get references
`C-i` - move back from go to definition
`C-o` - move forward to last definition jump
`<leader>sd` - search through diagnostics

### Editing

#### Surrouding (LazyExtra)

`gsa` - add surrounding
`gsd` - delete surrounding
`gsr` - replace surrounding
`gsae` - surround word

## Bookmarks

`ma` - set bookmark `a`, lower letter jumps only in currently openedfile, upper case letter jumps between files
\`a - jump to bookmark
`'a` - jump to bookmark, beggining of line
d\`a - delete from current cursor position to bookmark, `c` - replace, `y` - yank
`d'a` - delete from current line to line with mark

## Code commenting (Comment plugin)

`gcc` - Toggles the current line using linewise comment - NORMAL mode
`gc` - Toggles the region using linewise comment - VISUAL mode
`gc}` - Toggle until the next blank line
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode

## Moving in file

`}`, `{` - jump to next/prev blank line
`w`, `b` - jump to next/prev word
`<C-d>`, `<C-u>` - jump halp page down/up

## Editing

`guu`, `gUU` - change current line to lower / upper case
`u`, `U` - in visual mode, change selection to lower / upper case
`guw`, `gUw` - change to lower / upper case till end of word
`guaw`, `gUaw` - change to lower / upper case whole word
`I`, `A` - insert mode in the beginning / end of line

## TODOs

- [x] operating on tabs, or other means of vim way of work on multiple files - buffers + telescope + split
- [x] list of last opened files
- [/] autosave
- [x] split screen
- [x] bookmarks in code for faster jumping
- [x] lsp - run diagnostics, show errors (popup)
- [x] comment code shortcuts
- snippets like pdb
- [x] properly setup lsp, not with legacy mode - <https://github.com/neovim/nvim-lspconfig>
- [x] copy / paste to clipboard
- [x] show if unsaved file
- [ ] multiline editing - check <https://github.com/mg979/vim-visual-multi>

--------------

# nvim-tree

`g?` - show shortcuts
`a` - create new file or directory
<tab> - open preview
`E` - expand all
`W` - collapse all
`P` - parent directory

# vim navigation

<https://linkarzu.com/posts/neovim/neovim-nav-basics/> - good article with about navigating in vim

## Navigating through file

`ZZ` - save & close, like `:wq`
`C-[` - normal mode, like Esc
w - moves to the start of the next word (stops at symbols)
e - moves to the end of the next word (stops at symbols)
b - moves to the beginning of the previous word (stops at symbols)
C-u - (ctrl+u) moves up half page
C-d - (ctrl+d) moves down half page
gg - go to the top of the file
G - go to the end of the file
50gg - go to line 50gg

## Editing

u - undo (press multiple times to keep undoing)
ctrl-r - redo (press multiple times to keep redoing)
. - the last entered command, and leaves you in command mode

S+>> - (shift+>+>) indent line to the right
S+<< - (shift+<+<) indent line to the left
When in insert mode use <C-T> and <C-D>

J - joins 2 lines together. Keep pressing it to join more lines, adds a space

`yw` - yank word
`yy` - copies an entire line
`P` - paste before the cursor (or above if its a line)
`p` - paste after the cursor (or below if its a line)
`x` - deletes the character the cursor is on (leave pressed, same as supr)
`dd` - deletes entire line
`dw` - delete word starting from cursor position (stops at symbols)
`db` - deletes to the beginning of previous word (stops at symbols)

a stands for around, deletes spaces around
i stands for inside, does NOT delete spaces around
dip - delete inside paragraph
yip - yank inside paragraph
cip - change inside paragraph
vip - select inside paragraph

caw or ciw - for a word, doesn’t matter if you’re in the middle
ca" or ci" - for “text in double quotes”
ca' or ci' - for ‘text in single quotes’
[ca`] or [ci`] - for text in backtick quotes
ca( or ci( - for (text in parentheses)
ca{ or ci{ - for {text in curly braces}
ca[ or ci[ - for [text in square brackets]
cap or cip - for paragraphs

i - “insert” text before the cursor position.
a - “append” text after the cursor position.
I - “insert” text at the beginning of the line.
A - “append” text at the end of the line.
o - “open” a new line below the cursor and enter insert mode.
O - “open” a new line above the cursor and enter insert mode.
gi - takes you back to the last position you were in insert mode
