

# data flow
-  redirection( <<<, <<, <, |, >, >> )
- grouping (), {}
- /dev/null
- /dev/urandom


# generators
- echo
- printf
- seq
- date
- yes
- bc
- xargs


# filesystem
- tree
- find
- df 
- du


# whole file - metadata
- wc
- file
- ls
- stat


# line-by-line, usually
- cat
- head
- tail
- rev
- tac
- sort
- uniq
- shuf
- grep
- cut
- column
- sed


# line+character
- head
- cut
- awk


# character
- dd
- tr
- od
- hexdump
- xxd


# multi-file by line, usually
- diff
- paste
- comm
- join
- split


# example of adding up 1..1e8, i.e. 100 million numbers
```
$ time -p { seq 1 100000000 | sed -e '{ s#$# +\\# }' ; echo 0 ; } | bc
5000000050000000
real 82.98
user 93.41
sys 17.36
```






