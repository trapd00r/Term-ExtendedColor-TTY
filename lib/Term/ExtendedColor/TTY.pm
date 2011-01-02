#!/usr/bin/perl
package Term::ExtendedColor::TTY;

our $VERSION  = '0.001';

require Exporter;
@ISA = 'Exporter';
our @EXPORT = qw(set_tty_color);

use strict;
use Carp 'croak';

my %color_indexes = (
  0   => 'P0',
  1   => 'P8',
  2   => 'P9',
  3   => 'P2',
  4   => 'PA',
  5   => 'P3',
  6   => 'PB',
  7   => 'P4',
  8   => 'PC',
  9   => 'P5',
  10  => 'PD',
  11  => 'P6',
  12  => 'PE',
  13  => 'P7',
  14  => 'PF',
);

sub set_tty_color {
  my($index, $color) = @_;

  if( ($index < 0) or ($index > 15) ) {
    croak("Index must be between 0 and 15, inclusive\n");
  }
  if($color !~ /^[A-Za-z0-9]{6}$/) {
    croak("'$color' is not a valid hexadecimal color representation\n");
  }

  if( ($index eq 'bg') or ($index eq 'background') ) {
    $index = 0;
  }
  elsif( ($index eq 'fg') or ($index eq 'foreground') ) {
    $index = 1;
  }

  return( sprintf("\e]%s", $color_indexes{$index} . $color) );
}


=pod

=head1 NAME

Term::ExtendedColor::TTY - Set colors in the TTY

=head1 SYNOPSIS

    use Term::ExtendedColor::TTY;

    my $esc_str = set_tty_color(4, 'ff0000');
    print $esc_str;

=head1 DESCRIPTION

Term::ExtendedColor::TTY provides functions for changing and querying the
TTY (or Virtual Console, if you wish) for various resources, such as colors.

=head1 EXPORTS

=head2 set_tty_color()

Parameters: $index, $color

Returns:    $string

  # Change color index 5
  my $color = set_xterm_color(5, 'ff0000');
  print $color;

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
