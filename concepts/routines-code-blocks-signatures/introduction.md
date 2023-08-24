## Routines

[`Subs`][type/Sub] and [`Methods`][type/Method] are types of [`Routines`][type/Routine] in Raku.

A routine can exited at any time with a return value using the [`return`][control-return] keyword, a useful tool for creating functions.
If no `return` is specified, the last statement of the routine will be its implicit return value.

A routine can have a [`Signature`][language/signatures] inside parentheses before the code block.

[`Routine`][type/Routine] is a subclass of [`Block`][type/Block].

```raku
sub add ($x, $y) { return $x + $y }
say add(1, 2); # 3
```

Methods will be covered in a later concept relating to classes and objects.

## Blocks

A [`Block`][type/Block] is a reuseable code object, typically used to create lambdas.

The last statement of a block is its implicit return value.

A block can have a [`Signature`][language/signatures] prefixed with `->` before the code block.

[`Block`][type/Block] is a subclass of [`Code`][type/Code], which is the ultimate base class of all code objects in Raku.

```raku
my $add = -> $x, $y { $x + $y };
say $add(1, 2); # 3
```

## Signatures

A [`Signature`][language/signatures] is made up of zero or more [`Parameters`][type/Parameter], separated by commas.

A signature can be used to specify the arguments a `Block` will accept.

This concept will keep signatures simple, using only positional parameters with scalar-sigiled variables.
This will be expanded upon in later concepts.

[type/Sub]: https://docs.raku.org/type/Sub
[type/Method]: https://docs.raku.org/type/Method
[type/Routine]: https://docs.raku.org/type/Routine
[control-return]: https://docs.raku.org/language/control#return
[type/Block]: https://docs.raku.org/type/Block
[language/signatures]: https://docs.raku.org/language/signatures
[type/Parameter]: https://docs.raku.org/type/Parameter
[type/Code]: https://docs.raku.org/type/Code