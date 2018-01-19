#!/usr/bin/env perl6
use v6;
use Test;
use JSON::Fast;
use lib $?FILE.IO.dirname;
use Pangram;
plan 10;

my Version:D $version = v3;

if Pangram.^ver !~~ $version {
  warn "\nExercise version mismatch. Further tests may fail!"
    ~ "\nPangram is {Pangram.^ver.gist}. "
    ~ "Test is {$version.gist}.\n";
}

my $c-data = from-json $=pod.pop.contents;
for $c-data<cases>».<cases>».Array.flat {
  given is-pangram .<input> -> $result {
    subtest .<description>, {
      plan 2;
      isa-ok $result, Bool;
      is-deeply $result, .<expected>, 'Result matches expected';
    }
  }
}

=head2 Canonical Data
=begin code

{
  "exercise": "pangram",
  "comments": [
    "A pangram is a sentence using every letter of the alphabet at least once."
  ],
  "version": "1.3.0",
  "cases": [
    {
      "description": "Check if the given string is an pangram",
      "comments": [
        "Output should be a boolean denoting if the string is a pangram or not."
      ],
      "cases": [
        {
          "description": "sentence empty",
          "property": "isPangram",
          "input": "",
          "expected": false
        },
        {
          "description": "recognizes a perfect lower case pangram",
          "property": "isPangram",
          "input": "abcdefghijklmnopqrstuvwxyz",
          "expected": true
        },
        {
          "description": "pangram with only lower case",
          "property": "isPangram",
          "input": "the quick brown fox jumps over the lazy dog",
          "expected": true
        },
        {
          "description": "missing character 'x'",
          "property": "isPangram",
          "input": "a quick movement of the enemy will jeopardize five gunboats",
          "expected": false
        },
        {
          "description": "another missing character, e.g. 'h'",
          "property": "isPangram",
          "input": "five boxing wizards jump quickly at it",
          "expected": false
        },
        {
          "description": "pangram with underscores",
          "property": "isPangram",
          "input": "the_quick_brown_fox_jumps_over_the_lazy_dog",
          "expected": true
        },
        {
          "description": "pangram with numbers",
          "property": "isPangram",
          "input": "the 1 quick brown fox jumps over the 2 lazy dogs",
          "expected": true
        },
        {
          "description": "missing letters replaced by numbers",
          "property": "isPangram",
          "input": "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog",
          "expected": false
        },
        {
          "description": "pangram with mixed case and punctuation",
          "property": "isPangram",
          "input": "\"Five quacking Zephyrs jolt my wax bed.\"",
          "expected": true
        },
        {
          "description": "upper and lower case versions of the same character should not be counted separately",
          "property": "isPangram",
          "input": "the quick brown fox jumps over with lazy FX",
          "expected": false
        }
      ]
    }
  ]
}

=end code
