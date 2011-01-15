#!/usr/bin/perl
package Term::ExtendedColor::TTY::Colorschemes;

our $VERSION  = '0.003';

require Exporter;
@ISA = 'Exporter';
our @EXPORT = qw(get_colorscheme get_colorschemes);

use strict;
use Carp 'croak';

my $colorschemes = {
  xterm     => {
    0   => '000000',
    1   => 'cd0000',
    2   => '00cd00',
    3   => 'cdcd00',
    4   => '0000cd',
    5   => 'cd00cd',
    6   => '00cdcd',
    7   => 'e5e5e5',
    8   => '4d4d4d',
    9   => 'ff0000',
    10  => '00ff00',
    11  => 'ffff00',
    12  => '0000ff',
    13  => 'ff00ff',
    14  => '00ffff',
    15  => 'aabac8',
  },
  woldrich  => {
    0   => '030303',
    1   => '1c1c1c',
    2   => 'ff4747',
    3   => 'ff6767',
    4   => '2b4626',
    5   => 'b03b31',
    6   => 'ff8f00',
    7   => 'bdf1ed',
    8   => '1165e9',
    9   => '5496ff',
    10  => 'aef7af',
    11  => 'b50077',
    12  => 'cb1c13',
    13  => '6be603',
    14  => 'ffffff',
    15  => 'aabac8',
  },
  matrix    => {
    0   => '121212',
    1   => '021e00',
    2   => '032d00',
    3   => '043c00',
    4   => '054b00',
    5   => '065a00',
    6   => '076900',
    7   => 'ffffff',
    8   => '098700',
    9   => '0a9600',
    10  => '0ba500',
    11  => '0cb400',
    12  => '0dc300',
    13  => '0ed200',
    14  => '0fe100',
    15  => 'aabac8',
  },

  purple    => {
    0   => '121212',
    1   => '300a97',
    2   => '430ac0',
    3   => '830abf',
    4   => '7b0ad2',
    5   => '370ad3',
    6   => '650a78',
    7   => 'ffffff',
    8   => '960ac9',
    9   => '5a0a8b',
    10  => '5d0ac8',
    11  => '8a0afa',
    12  => '7b0a73',
    13  => '8b0a25',
    14  => '500a98',
    15  => 'aabac8',
  },

  blue      => {
    0   => '121212',
    1   => '141fe1',
    2   => '1e2fd2',
    3   => '283fc3',
    4   => '324fb4',
    5   => '3c5fa5',
    6   => '466f96',
    7   => 'ffffff',
    8   => '5a8f78',
    9   => '649f69',
    10  => '6eaf5a',
    11  => '78bf4b',
    12  => '82cf3c',
    13  => '8cdf2d',
    14  => '96ef1e',
    15  => 'aabac8',
  },

  grey      => {
    0   => '121212',
    1   => '888888',
    2   => '444444',
    3   => '242424',
    4   => '2d2d2d',
    5   => '363636',
    6   => '3f3f3f',
    7   => 'ffffff',
    8   => '515151',
    9   => '5a5a5a',
    10  => '636363',
    11  => '6c6c6c',
    12  => '757575',
    13  => '7e7e7e',
    14  => '878787',
    15  => 'aabac8',

  },

  rasta     => {
    0   => '121212',
    1   => '3c8d0a',
    2   => '8f0d0a',
    3   => '33810a',
    4   => '349e0a',
    5   => '12a10a',
    6   => '729a0a',
    7   => 'ffffff',
    8   => '104770',
    9   => 'b3410a',
    10  => 'f0120a',
    11  => 'b63e0a',
    12  => '774c0a',
    13  => '5d450a',
    14  => '56540a',
    15  => 'aabac8',
  },

  breeze    => {
    0   => '121212',
    1   => '1043c1',
    2   => '1865a2',
    3   => '208783',
    4   => '28a964',
    5   => '30cb45',
    6   => '38ed26',
    7   => 'ffffff',
    8   => '49210e',
    9   => '51412c',
    10  => '59614a',
    11  => '618168',
    12  => '69a186',
    13  => '71c1a4',
    14  => '79e1c2',
    15  => 'aabac8',
  },

};

sub get_colorschemes { return keys %{ $colorschemes }; }

sub get_colorscheme {
  my $colorscheme = shift;
  if(exists($colorschemes->{$colorscheme})) {
    return $colorschemes->{$colorscheme};
  }
  else {
    croak("'$colorscheme' is not a valid colorscheme\n");
  }
}

=pod

=head1 NAME

Term::ExtendedColor::TTY::Colorschemes - Colorschemes for the TTY

=head1 SYNOPSIS

    use Term::ExtendedColor::TTY;
    use Term::ExtendedColor::TTY::Colorschemes;

=head1 DESCRIPTION

B<Term::ExtendedColor::TTY::Colorschemes> exports functions for retrieving and
using colorschemes in the TTY. This is intended to be used with
L<Term::ExtendedColor::TTY>.

=head1 EXPORTS

=head2 get_colorscheme()

Parameters: $colorscheme

Returns:    \%colorscheme

  my $colorscheme  = get_colorscheme('xterm');

Returns a hash reference where its keys will be the color index and the value
the hexadecimal color value.

=head2 get_colorschemes()

Paramters: $string

Returns:   @colorschemes

In list context, return a list of all available colorschemes (strings).
In scalar context, return the number of available colorschemes.

=head1 SEE ALSO

L<Term::ExtendedColor::TTY>, L<Term::ExtendedColor::Xresources>,
L<Term::ExtendedColor>

=head1 AUTHOR

  Magnus Woldrich
  CPAN ID: WOLDRICH
  magnus@trapd00r.se
  http://japh.se

Written by Magnus Woldrich

=head1 COPYRIGHT

Copyright 2010, 2011 Magnus Woldrich <magnus@trapd00r.se>. This program is free
software; you may redistribute it and/or modify it under the same terms as
Perl itself.

=cut

1;
