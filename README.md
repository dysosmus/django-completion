django-completion
==================
Provide a basic bash completion for manage.py of django (tested with django 1.6).

Installation
------------

 1. Get the `django-completion.bash` file.

 2. Copy/move the `django-completion.bash` in your `bash_completion.d`
    folder (`/etc/bash_completion.d`, `/usr/local/etc/bash_completion.d`or `~/bash_completion.d`).

 3. **Or** copy/move it where you want and then load the `django-completion.bash` file in your `~/.bashrc` or `~/.profile` like that:

 		source django-completion.bash

 4. Reload your shell with something like `source ~/.bashrc` or `source ~/.profile`

Good to know
------------
The completion only work if your manage.py is executable.