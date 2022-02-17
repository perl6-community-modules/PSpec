use Test;

unit module PSpec:ver<4.0.1>:auth<zef:raku-community-modules>;

## Perform a block of code x number of times.
multi sub infix:<times>(Int $num, &closure) is export {
    for ^$num { closure() }
}

## Same thing, just the other way around.
sub infix:<xxx>(&closure, Int $num) is export {
    $num times &closure;
}

## Returns the output of a test to describe.
sub infix:<should>($got, $want) is export {
    $want ~~ Callable
      ?? $want($got)
      !! ($got, $want)
}

## eq, the most basic test possible. The same as passing the raw value.
sub eq($val) is export { $val }

## gt, is a value greater than?
sub gt(Numeric $want) is export { * > $want }

## lt, is a value lesser than?
sub lt(Numeric $want) is export { * < $want }

# Public function: describe ($class_name, $method_name, @tests)
# Implements a describe statement inspired by the one from RSpec.
# The @tests array must contain Pair objects, where the key is the
# name of the test, and the value is a closure containing the actual
# test to perform. The output must be sent by the 'should' operator.
#
#     describe "PSpec", "times", [
#         'operator works' => {
#             my $value = 0;
#             20 times { $value++ }
#             return $value, 20;
#         },
#     ];
#

sub describe($class, $name, @tests) is export {
    for @tests -> $pair {
        my $sub := $pair.value;
        my @return = $sub();
        my $test = "$class.$name: {$pair.key}";
        if @return.elems == 1 {
            ok @return[0], $test;
        }
        elsif @return.elems == 2 {
            is @return[0], @return[1], $test;
        }
        else {
            die "invalid test paramters";
        }
    }
}

=begin pod

=head1 NAME

PSpec - An RSpec-like testing framework for Raku

=head1 SYNOPSIS

=begin code :lang<raku>

use PSpec;

=end code

=head1 DESCRIPTION

PSpec is an implementation of Ruby's RSpec library, in Raku.
It's currently very minimal, and does not implement much of RSpec.

=head1 STATUS

=item Supports basic "describe" commands.
=item Supports a very simplistic "should" statement.
=item Has eq(), lt() and gt() subs that perform simplistic tests.

=head1 TODO

Lots. This is barely functional, but is pretty much back to the level of
the last working version prior to the rewrite.

=head1 CREDITS

Well, I must send kudos to the original authors of RSpec and Cucumber,
without them, this wouldn't exist.

Also, a big cheers to Carl Masak, who is always friendly and helpful!
And a call-out to Larry Wall whose help on the #raku channel has been 
greatly appreciated! I guess I should also thank him for creating Perl :-)

Since writing the original version of this Credits section, I've received
a lot of help and feedback from many people on the #raku channel. Thanks
to the whole Raku community for being awesome!

=head1 AUTHOR

Timothy Totten

Source can be located at: https://github.com/raku-community-modules/PSpec .
Comments and Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2010 - 2019 Timothy Totten

Copyright 2020 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
