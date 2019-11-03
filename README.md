# Yay Upgraded

Simple script wrapping [yay](https://github.com/Jguer/yay) and adding fuzzy finder to common actions. Also provides extra details in sidebar.

***WARNING: This is personal evening project. Use at your responsibility.***

## Usage

### Install

List all packages and install selected. If parameter is supplied, is is given to fuzzy finder as default query.

```yup -i [package_name]```

### Remove

Works same way as install but for installed packages.

```yup -r [parameter]```

### Details about package

List installed packages and show details in sidebar. With `Enter` details are shown expanded in pager (default: less).

```yup -d [package_name]```


## Dependencies

- [yay](https://github.com/Jguer/yay)
- [fzf](https://github.com/junegunn/fzf) (can be replaced [skim](https://github.com/lotabout/skim), it is waster but has worse sorting score on exact match)
- zsh/fish


