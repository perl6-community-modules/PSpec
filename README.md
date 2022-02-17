[![Actions Status](https://github.com/raku-community-modules/PSpec/workflows/test/badge.svg)](https://github.com/raku-community-modules/PSpec/actions)

NAME
====

PSpec - An RSpec-like testing framework for Raku

SYNOPSIS
========

```raku
use PSpec;
```

DESCRIPTION
===========

PSpec is an implementation of Ruby's RSpec library, in Raku. It's currently very minimal, and does not implement much of RSpec.

STATUS
======

  * Supports basic "describe" commands.

  * Supports a very simplistic "should" statement.

  * Has eq(), lt() and gt() subs that perform simplistic tests.

TODO
====

Lots. This is barely functional, but is pretty much back to the level of the last working version prior to the rewrite.

CREDITS
=======

Well, I must send kudos to the original authors of RSpec and Cucumber, without them, this wouldn't exist.

Also, a big cheers to Carl Masak, who is always friendly and helpful! And a call-out to Larry Wall whose help on the #raku channel has been greatly appreciated! I guess I should also thank him for creating Perl :-)

Since writing the original version of this Credits section, I've received a lot of help and feedback from many people on the #raku channel. Thanks to the whole Raku community for being awesome!

AUTHOR
======

Timothy Totten

Source can be located at: https://github.com/raku-community-modules/PSpec . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2010 - 2019 Timothy Totten

Copyright 2020 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

