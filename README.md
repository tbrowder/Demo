NAME
====

**Demo** - Demonstrates access to `$?DISTRIBUTION` and `%?RESOURCES` for installed module distributions

SYNOPSIS
========

```raku
use Demo;
```

DESCRIPTION
===========

**Demo** aims to demonstrate use of the special variables, `$?DISTRIBUTION` and `%?RESOURCES`, to access files included in an installed module distribution.

This module has a binary executable, `demo`, which, when executed, shows the results of using the variables to access the following file (all text files):

    bin/demo
    resources/file1     # <== listed in the C<META6.json> file
    resources/file2     # <== listed in the C<META6.json> file
    lib/Demo.rakumod    # <== listed in the C<META6.json> file
    t/01-basic.rakutest # <== B<NOT> listed in the C<META6.json> file

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2023 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

