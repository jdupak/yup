# Yay Upgraded

Simple script wrapping [yay](https://github.com/Jguer/yay) and adding fuzzy finder to common actions. Also provides extra details in sidebar.

***WARNING: This is personal evening project. Use at your responsibility.***

## Usage

### Install

List all packages and install selected. If parameter is supplied, it is given to fuzzy finder as default query.

```yup -i [package_name]```

### Remove

Works same way as install but for installed packages.

```yup -r [parameter]```

### Details about package

List installed packages and show details in sidebar. With `Enter` details are shown expanded in pager (default: less).

```yup -d [package_name]```

### Update

Update has multiple features.

It performs system update by calling `yay -Syu`. It also looks for file `updators.sh` in `.config`. If file is found it executes list of update commands of other application separated by newline. It also provides summary of failed commands.

Idea behind this is that every program which has some kind of update not managed by package manager (rustup, oh-my-fish, pip...) would register here to have all updates managed wrom one place. For now, this has to be done by hand.

```yup -u```

## Dependencies

- [yay](https://github.com/Jguer/yay)
- [fzf](https://github.com/junegunn/fzf) (can be replaced with [skim](https://github.com/lotabout/skim), it is waster but has worse sorting score on exact match)
- fish (Zsh support has been droped as I do not use it any more.)


