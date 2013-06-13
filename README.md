# .dotfiles

.dotfiles to configure a lot of stuff on OS X: zsh, prompt, ruby, git, ...
Feel free to use it at your own risk ;)

## Install

```sh
git clone git@github.com:TimPetricola/dotfiles.git
cd ~/.dotfiles
script/bootstrap
```

You should probably change the name and email in `git/gitconfig.symlink`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
