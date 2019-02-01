# .dotfiles

.dotfiles to configure a lot of stuff on OS X: zsh, prompt, ruby, git, ...
Feel free to use it at your own risk ;)

More than inspired by [Zack Holman's dotfiles](https://github.com/holman/dotfiles).

## Install

```sh
git clone git@github.com:TimPetricola/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
script/bootstrap
```

You should probably change the name and email in `git/gitconfig.symlink`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is expected to setup `$PATH` or similar.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
