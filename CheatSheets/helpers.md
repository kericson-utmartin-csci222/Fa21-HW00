# Helpful Cheatsheets for CSCI 222 #
(also generally Linux/Git/emacs)

## Linux Commands ##
Command | Effect
------- | ------
cat | con**cat**enates a file to console (it has other uses, but this is a common one!)
mkdir | makes a new folder (or **dir**ectory in the file system)
ls |
pwd |
man |
less | 
more |
cd | **c**hange **d**irectory (move to a different folder)
cp | **c**o**p**y a file to a new position
mv |
rmdir | **r**e**m**ove a **dir**ectory (folder)
touch | easy way to create a new file
grep | search for strings in a file (or files)
head |
tail |
ping |
ctrl-c | hold control and hit c - this kills whatever command is running (or aborts a half-typed command)
ctrl-z |
top |
history |


## Git Commands ##
Command | Effect
------- | ------
git clone | creates a local repository from a remote repository (generally once per repository)
git status | check on the status of your current repository
git add <file> | stage a specific file for a commit
git rm <file> |
git checkout <file> |
git checkout -b <branch> | 
git branch | 
git stash |
git pull |
git unstage |


## emacs Commands ##
Command | Effect
------- | ------
emacs -nw | Opens emacs with **n**o **w**indow
emacs -nw <filename> | opens the file <filename> for editing in emacs with **n**o **w**indow
C-x C-s | save the current buffer
C-x C-c | close the current buffer
C-x C-f |
C-x space | start marking (useful for cutting, commenting, etc)
C-s |
C-r |
C-g | quit the current command (in case you start doing something, and then realize you aren't doing what you want to)
C-x C-w | cut
C-x C-y | paste
M-x comment-region |
M-x uncomment-region |
M-f |
M-b |
C-u | undo
C-n |
C-p |
C-f |
C-b |
C-a |
C-e |

### Super Special CSCI 222 emacs Commands ###
Command | Effect
------- | ------
M-x main |
M-x file-doq |
M-x fun-doq | 