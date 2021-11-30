#!/bin/env python3

import os

targets = dict()
targets['neovim'] = (os.path.abspath('neovim/.config/nvim'), os.path.expanduser('~/.config/nvim'))
targets['tmux'] = (os.path.abspath('tmux/.tmux.conf'), os.path.expanduser('~/.tmux.conf'))
targets['kitty'] = (os.path.abspath('kitty/.config/kitty'), os.path.expanduser('~/.config/kitty'))

if __name__ == "__main__":
    for target in targets:
        print(f'{target}:')
        src = targets[target][0]
        dest = targets[target][1]

        if not os.path.exists(src):
            print(f'{src} does not exist\n')
            continue

        # dest does not exist
        if not os.path.exists(dest):
            print(f'creating symlink\n')
            os.symlink(src, dest)
            continue
        
        if os.path.islink(dest):
            print('removing old link')
            os.remove(dest)
            print(f'creating new symlink\n')
            os.symlink(src, dest)
        else:
            print(f'please (re)move {dest}\n')
