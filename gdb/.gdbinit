set auto-load safe-path /

set print pretty on
set print elements 0
set print array-indexes on
set print object on

set disassembly-flavor intel
set disassemble-next-line on

set history save on
set history size 1000
set history filename ~/.gdb_history

set breakpoint pending on

tui enable
focus cmd

set tui border-kind acs
set tui compact-source on
set tui mouse-events on

