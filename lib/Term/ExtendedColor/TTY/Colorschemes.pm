#!/usr/bin/perl
package Term::ExtendedColor::Colorschemes;

our $VERSION  = '0.001';

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


=head1 EXPORTS

=head2 get_colorscheme()

Parameters: $colorscheme

Returns:    \%colorscheme

  my $colorscheme  = get_colorscheme('xterm');

=head1 SEE ALSO

L<Term::ExtendedColor>, L<Term::ExtendedColor::Xresources>

=head1 AUTHOR

  Magnus Woldrich
  CPAN ID: WOLDRICH
  magnus@trapd00r.se
  http://japh.se

Written by Magnus Woldrich

=head1 COPYRIGHT

Copyright 2010 Magnus Woldrich <magnus@trapd00r.se>. This program is free
software; you may redistribute it and/or modify it under the same terms as
Perl itself.

=cut

1;
