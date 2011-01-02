#!/usr/bin/perl
use Test::More tests => 1;

use Term::ExtendedColor::TTY;
use Data::Dumper;
$Data::Dumper::Terse     = 1;
$Data::Dumper::Indent    = 1;
$Data::Dumper::Useqq     = 1;
$Data::Dumper::Deparse   = 1;
$Data::Dumper::Quotekeys = 0;
$Data::Dumper::Sortkeys  = 1;


chomp(my $esc = Dumper( set_tty_color(1, 'ff0000') ));
is($esc, '"\e]P8ff0000"', 'Set color index 1');
