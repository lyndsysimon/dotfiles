RPROMPT='$(zshprompt.py right --last-exit-status=$?)'
PROMPT='$(zshprompt.py left)'
# Since we're already displaying venv names, disable virtualenv's prepending.
export VIRTUAL_ENV_DISABLE_PROMPT=1
