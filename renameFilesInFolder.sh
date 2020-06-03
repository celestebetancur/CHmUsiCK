ls -v | cat -n | while read n f; do mv -n "$f" "$n.wav"; done 
