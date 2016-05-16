#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Deep;
use DDG::Test::Goodie;

zci answer_type => 'coin';
zci is_cached   => 0;

ddg_goodie_test(
    [qw( DDG::Goodie::Coin )],
    'flip a coin' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'flip coin' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'flip 1 coin' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'flip 2 coins' => test_zci(
        re(qr/(heads|tails), (heads|tails) \(random\)/),
        structured_answer => {
            input     => [2],
            operation => 'Flip coin',
            result    => re(qr/(heads|tails), /)
        }
    ),
    'toss a coin' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'toss 1 coin' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'toss 2 coins' => test_zci(
        re(qr/(heads|tails), (heads|tails) \(random\)/),
        structured_answer => {
            input     => [2],
            operation => 'Flip coin',
            result    => re(qr/(heads|tails), /)
        }
    ),
    'heads or tails' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'heads or tails?' => test_zci(
        re(qr/(heads|tails) \(random\)/),
        structured_answer => {
            input     => [1],
            operation => 'Flip coin',
            result    => re(qr/^(heads|tails)$/)
        }
    ),
    'flip 4 coins' => test_zci(
        re(qr/((heads|tails),? ){4}\(random\)/),
        structured_answer => {
            input     => [4],
            operation => 'Flip coin',
            result    => re(qr/(heads|tails),? /)
        }
    ),
);

done_testing;
