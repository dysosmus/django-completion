#!/bin/env bash

##
# Parse the help of the manage.py to find the options avaible
##
_manage_django() {
    local django_help="$(./manage.py --help 2> /dev/null)"
    local current_word=${COMP_WORDS[COMP_CWORD]}
    local options=$(python - "$django_help" <<END
import re, sys
input_str = sys.argv[1]
to_strip  = ' \n\t\r'
# capture :
#     [staticfiles]
#         collectstatic
#         findstatic
#         runserver
# (?:
#     ^[[a-z0-9-_]+]
#     ([\na-z0-9 _-]*)
# )
# capture:
#     -v --verbosity --settings=
# (
#     --?[a-z_-]+=?
# )
pattern  = ur'(?:^[[a-z0-9-_]+]([\na-z0-9 _-]*))|(--?[a-z_-]+=?)'
regex    = re.compile(pattern, re.I | re.M) # case insentive and multiline match
results  = regex.findall(input_str)
words    = [ word.strip(to_strip) for raw in results for raw_words in raw for word in raw_words.split(' ') if word.strip(to_strip) ]

print(' '.join(words))
END
    )

   COMPREPLY=( $( compgen -W "$options" -- "$current_word" ) )
}

complete -o default -F _manage_django manage.py