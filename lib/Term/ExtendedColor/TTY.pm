#!/usr/bin/perl
package Term::ExtendedColor::TTY;

our $VERSION  = '0.003';

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
  my $map = shift;

  ref($map) eq 'HASH' or croak("set_tty_color() expects an hashref");

  my %results;

  for my $index(sort{ $a <=> $b } keys(%{$map})) {
    if( ($index < 0) or ($index > 14) ) {
      croak("'$index': color index must be between 0 and 14, inclusive\n");
    }
    if($map->{$index} !~ m/^(?:[A-Za-z0-9]{6}$)/) {
      croak(
        "'$map->{$index}' is not a valid hexadecimal color representation\n"
      );
    }

    $results{$index} = sprintf("\e]%s",
      $color_indexes{$index}
        . $map->{$index}, #P0ffffff
      );
  }

  return \%results;
}

=pod

=head1 NAME

Term::ExtendedColor::TTY - Set colors in the TTY

=head1 SYNOPSIS

    use Term::ExtendedColor::TTY;

    my %colorscheme = (
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
    );

    my $result = set_tty_color( \%colorscheme );

    for my $index(sort(keys(%{$result}))) {
      print "Setting color index $index... $result->{$index}\n";
    }


=head1 DESCRIPTION

Term::ExtendedColor::TTY provides functions for changing and querying the
TTY (or Virtual Console, if you wish) for various resources, such as colors.

=head1 EXPORTS

=head2 set_tty_color()

Parameters: \%colormap

Returns:    \%results

  my $ref = set_tty_color( \%colorscheme );

Returns a hash reference where its keys are the color indexes ( 0 .. 14) and the
values are escape sequences crafted together to be printed straight to the TTY.

=head1 SEE ALSO

L<Term::ExtendedColor::TTY::Colorschemes>, L<Term::ExtendedColor>, L<Term::ExtendedColor::Xresources>

=head1 AUTHOR

  Magnus Woldrich
  CPAN ID: WOLDRICH
  magnus@trapd00r.se
  http://japh.se

=head1 COPYRIGHT

Copyright 2010, 2011 Magnus Woldrich <magnus@trapd00r.se>. This program is free
software; you may redistribute it and/or modify it under the same terms as
Perl itself.

=cut

1;
