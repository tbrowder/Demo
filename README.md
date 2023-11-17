[![Actions Status](https://github.com/tbrowder/Demo/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Demo/actions) [![Actions Status](https://github.com/tbrowder/Demo/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Demo/actions) [![Actions Status](https://github.com/tbrowder/Demo/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Demo/actions)

NAME
====

**Demo** - Demonstrates access to `$?DISTRIBUTION` "resources" for installed module distributions

SYNOPSIS
========

```raku
use Demo;
```

DESCRIPTION
===========

**Demo** aims to demonstrate use of the special variable, `$?DISTRIBUTION`, to access files included in an installed module distribution.

This module has a binary executable, `demo`, which, when executed, shows the results of using the variable to access the following file (all text files):

    bin/demo
    resources/file1      # <== listed in the C<META6.json> file
    resources/file2      # <== listed in the C<META6.json> file
    resources/sdir/file3 # <== listed in the C<META6.json> file
    lib/Demo.rakumod     # <== listed in the C<META6.json> file
    t/01-basic.rakutest  # <== B<NOT> listed in the C<META6.json> file

The provided subroutines may be used to provide users of the installed module to access the contents of resources files.

For the moment, authors must list the desired resources twice: once in the CMETA6.json> file and once in the source code's `resources` directory.

Eventally, `App::Mi6`'s `mi6` binary program's `build` command will ensure the `META6.json`'s `resources` list is the exact duplicate of the source `resources` directory so the author will not have to maintain two lists.

CREDITS
=======

Thanks to Nick Logan (@ugexe on Github and IRC #raku) for his advice and his powerful `zef` program.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2023 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

