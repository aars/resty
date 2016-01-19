# TODOs and considerations

* There must be a better/cleaner way to replace special chars with codes.

  Maybe use an external lib? (Perl/Python?)

* Decide on var names

  - We've got `host` which is actually a file. Files should probably be called
    something recognizable like `host` file. But `host` doesn't really cover
    the content of the file, which is a `url`, or... `remote`?? 
  - I've (Aaron) added the term `remote` which is also used in output. Keep it?
    if so, fix throughout code.

# TODOs from code

* `133   ┆ ┆ ┆ # TODO; try adapt ; echo "$opt" | grep '^-[a-zA-Z]*v[a-zA-Z]*$' >/dev/null)`
  
  I have no idea what this is supposed to do :)

* `138   ┆ ┆ ┆ -W);; # §todo: check why nothing?`
  
  Check for `-W` usage in call (after sourcing)
