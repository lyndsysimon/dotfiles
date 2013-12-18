My ZSH prompt in Python, with:

- A horizontal rule (as wide as the terminal) before each prompt
  (when scrolling this makes it easier to see where one command's output ends and the next command begins)
- Nicely truncated current working directory (like fish shell)
- Active virtualenv
- Git branch
- Non-zero exit status
- user@host only if connected over ssh

To use, put `zshprompt.py` on your `$PATH` and put `source /path/to/zshprompt.zsh` in your `.zshrc` file.

Requires Python 2.7 (so for example it'll work on Ubuntu 12.04 but not on 10.04) and [psutil](http://code.google.com/p/psutil/), on Ubuntu:

    sudo apt-get install python-psutil

TODO: Get rid of psutil dependency (it's used to get the username). Support older versions of Python.

<img src="https://gslb-dl.dropbox.com/s/lvdqbeap0g94abp/zshprompt.png?token_hash=AAFu5gyNQqzqv_ecA3zGwmvfQOUZI2eLXGyc1E9-6JxRTw&dl=1" height="453" width="648" alt="Screenshot" />

I would like to add a couple more features, including:

- Allow the prompts to be customised with command-line format options
- Fall back on a basic pure-zsh prompt if zshprompt.py exits with non-zero

Known issues:

- Symlinks get expanded in the current working directory
- Getting the git branch can be slow the first time you cd into a git repo