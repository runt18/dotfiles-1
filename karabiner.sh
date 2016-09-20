#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set general.dont_remap_internal 1
/bin/echo -n .
$cli set remap.commandL2optionL 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f1 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f10 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f3_lion 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f5 1
/bin/echo -n .
$cli set remap.fkeys_to_consumer_f7 1
/bin/echo -n .
$cli set remap.optionL2commandL 1
/bin/echo -n .
$cli set remap.uk_section2backquote 1
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set repeat.wait 53
/bin/echo -n .
/bin/echo
