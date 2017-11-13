# Improved shell ENVironment

A clone of https://github.com/denyskoch/ienv

## Installation
```bash
git clone https://github.com/iantruslove/ienv ~/.ienv && ~/.ienv/install.sh
```

You should also install Solarized color theme for your terminal. ([ethanschoonover.com/solarized](http://ethanschoonover.com/solarized))

For faster and better fuzzy search results install **ag** the silver searcher:

```bash
brew install ag
```


## Customizing / Extending
You can edit and customize your .baschrc, .vimrc, .tmux.conf as usual. IENV is integrated gracefully (no symlinks, no file copies), so things should not break. Take a look at your .bashrc for example:

```bash
...

### IENV ###
[ -r ~/.ienv/entrypoint ] && source ~/.ienv/entrypoint
### VNEI ###
```

Since its just an include, you can simple add or override settings you like.

### Dark color theme
Simply switch terminal color theme e.g. solarized dark:
<img width="906" alt="dark" src="https://user-images.githubusercontent.com/1089800/28995979-3b17bad4-79f7-11e7-9f05-021c9d37e12e.png">

## Shell
* automatically cd to directory:

    ```bash
    /work $ kitchen
    cd -- kitchen
    /work/kitchen $
    ```
* auto correct wrong spelled directories

    ```bash
    /work/demo $ ls
    abc bar foo

    /work/demo $ cd bra
    /work/demo/bar $
    ```

* search in bash history with arrow keys e.g.:

    ```bash
    /work/demo/bar $ ssh<arrow up>
    ```

### Aliases
#### common
* **pw**: generate strong password with help of openSSL
* **h**: show history
* **hs**: history search (i.e. history | grep -i)
* **..**: go one directory up
* **...**: go two directories up
* **....**: go three directories up
* **dl**: go to downloads folder i.e. cd ~/Downloads
* ***p**: go to project directory i.e. cd ~/Projects
* **gp**: go to GO workspace i.e. cd $GOPATH
* **ll**: long list i.e. ls -ahl
* **ips**: show current IPs

    ```
    $ ips
    Public: 95.208.248.59
    Local: 192.168.0.164
    Gateway: 192.168.0.1
    ```



#### git and related
* **g**: shortcut for git
* **s**: git status
* **a &lt;files&gt;**: git add (**a -A** to add all files)
* **c**: git commit
* **cm &lt;msg&gt;**: git commit -m
* **d**: git diff
* **co &lt;branch&gt;**: git checkout
* **l**: fancy git log (graph)

#### macOS
* **update**: update software and brew software
* **flushdns**: clear dns cache
* **hidedesktop / showdesktop**: Hide/show all desktop icons (useful when presenting)


### Remote Shell
* for remote hosts/shels the hostname is printed on the right
* root shells looks dangerous for more attention and prevent upss
<img width="1058" alt="remote" src="https://user-images.githubusercontent.com/1089800/28995983-3b1bd61e-79f7-11e7-9002-7f145095fde6.png">

## GIT
* push strategy is set to simple
* default editor is vim
* colors set to auto
* gobal gitignore for annoying OS generated files:

    ```
    .DS_Store
    .DS_Store?
    ._*
    .Spotlight-V100
    .Trashes
    __MACOSX
    ehthumbs.db
    Thumbs.db
    Desktop.ini
    *~
    *.swp
    *.swo
    ```

### macOS bash
```
bash: shopt: autocd: invalid shell option name
bash: shopt: dirspell: invalid shell option name
bash: update_terminal_cwd: command not found
```
Since macOS is using a old version of bash, this errors will occur.

Bash v4+ is required, you can install it via brew `brew install bash` ([brew.sh](https://brew.sh))
