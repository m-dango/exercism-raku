#!/usr/bin/env perl6
use v6;
use Test;
use JSON::Fast;
use lib $?FILE.IO.dirname;
use Scrabble;
plan 11;

my Version:D $version = v2;

if Scrabble.^ver !~~ $version {
  warn "\nExercise version mismatch. Further tests may fail!"
    ~ "\nScrabble is {Scrabble.^ver.gist}. "
    ~ "Test is {$version.gist}.\n";
}

my $c-data = from-json $=pod.pop.contents;
is .<input>.&score, |.<expected description> for @($c-data<cases>);

=head2 Canonical Data
=begin code

{
  "exercise": "scrabble-score",
  "version": "1.0.0",
  "cases": [
    {
      "description": "lowercase letter",
      "property": "score",
      "input": "a",
      "expected": 1
    },
    {
      "description": "uppercase letter",
      "property": "score",
      "input": "A",
      "expected": 1
    },
    {
      "description": "valuable letter",
      "property": "score",
      "input": "f",
      "expected": 4
    },
    {
      "description": "short word",
      "property": "score",
      "input": "at",
      "expected": 2
    },
    {
      "description": "short, valuable word",
      "property": "score",
      "input": "zoo",
      "expected": 12
    },
    {
      "description": "medium word",
      "property": "score",
      "input": "street",
      "expected": 6
    },
    {
      "description": "medium, valuable word",
      "property": "score",
      "input": "quirky",
      "expected": 22
    },
    {
      "description": "long, mixed-case word",
      "property": "score",
      "input": "OxyphenButazone",
      "expected": 41
    },
    {
      "description": "english-like word",
      "property": "score",
      "input": "pinata",
      "expected": 8
    },
    {
      "description": "empty input",
      "property": "score",
      "input": "",
      "expected": 0
    },
    {
      "description": "entire alphabet available",
      "property": "score",
      "input": "abcdefghijklmnopqrstuvwxyz",
      "expected": 87
    }
  ]
}

=end code
