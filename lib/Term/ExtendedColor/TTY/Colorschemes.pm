package Term::ExtendedColor::TTY::Colorschemes;
use strict;

BEGIN {
  use Exporter;
  use vars qw($VERSION @ISA @EXPORT);

  $VERSION = '0.012';
  @ISA     = qw(Exporter);
  @EXPORT  = qw(
    get_colorscheme
    get_colorschemes
  );
}

use Carp qw(croak);

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
  freakcode => {
    0  => '000000',
    1  => 'ff6565',
    2  => '93d44f',
    3  => 'eab93d',
    4  => '204a87',
    5  => 'ce5c00',
    6  => '89b6e2',
    7  => 'cccccc',
    8  => '555753',
    9  => 'ff8d8d',
    10 => 'c8e7a8',
    11 => 'ffc123',
    12 => '3465a4',
    13 => 'f57900',
    14 => '46a4ff',
    15 => 'ffffff',
  },
  leosolaris => {
    0  => '000000',
    1  => 'A80000',
    2  => '00A800',
    3  => 'A85400',
    4  => '0000A8',
    5  => 'A800A8',
    6  => '00A8A8',
    7  => 'A8A8A8',
    8  => '545054',
    9  => 'F85450',
    10 => '50FC50',
    11 => 'F2FC50',
    12 => '5054F8',
    13 => 'F854F8',
    14 => '50FCF8',
    15 => 'F8FCF8',
  },
  smurnjiff => {
    0  => '2e3436',
    8  => '555753',
    1  => 'cc0000',
    9  => 'ef2929',
    2  => '00ff00',
    10 => '66ff66',
    3  => 'c4a000',
    11 => 'fc394f',
    4  => '3456a4',
    12 => '729fcf',
    5  => '75507b',
    13 => 'ad7fa8',
    6  => '418179',
    14 => '34e2e2',
    7  => 'd3d7cf',
    15 => 'eeeeec',
  },
  calcandcoffee => {
    0 => 262729,
    1 => "F92671",
    10 => "A6E22E",
    11 => "FD971F",
    12 => "66D9EF",
    13 => "9E6FFE",
    14 => "A3BABF",
    15 => "F8F8F2",
    2 => "A6E22E",
    3 => "FD971F",
    4 => "66D9EF",
    5 => "9E6FFE",
    6 => "5E7175",
    7 => "F8F8F2",
    8 => 554444,
    9 => "F92671"
  },
  daisuke2 => {
    0 => "000000",
    1 => "ff6565",
    10 => "c8e7a8",
    11 => "ffc123",
    12 => "3465a4",
    13 => "f57900",
    14 => "46a4ff",
    15 => "ffffff",
    2 => "93d44f",
    3 => "eab93d",
    4 => "204a87",
    5 => "ce5c00",
    6 => "89b6e2",
    7 => "cccccc",
    8 => 555753,
    9 => "ff8d8d"
  },
  digerati => {
    0 => 303030,
    1 => "c03000",
    10 => "A6CD07",
    11 => "B5C865",
    12 => "4A7781",
    13 => "FF3B77",
    14 => "4bb5c1",
    15 => "e2e2e5",
    2 => "b1d631",
    3 => "fecf35",
    4 => 426870,
    5 => "6D506D",
    6 => "4bb5c1",
    7 => "e2e2e5",
    8 => "5F5F5F",
    9 => "FF3A78"
  },
  longbow => {
    0 => 222222,
    1 => "9E5641",
    10 => "C4DF90",
    11 => "FFE080",
    12 => "B8DDEA",
    13 => "C18FCB",
    14 => "6bc1d0",
    15 => "cdcdcd",
    2 => "6C7E55",
    3 => "CAAF2B",
    4 => "7FB8D8",
    5 => "956D9D",
    6 => "4c8ea1",
    7 => 808080,
    8 => 454545,
    9 => "CC896D"
  },
  rasi => {
    0 => 101010,
    1 => "f13a21",
    10 => "ffc005",
    11 => "93ff00",
    12 => "0071ff",
    13 => "ef0051",
    14 => "4bb8fd",
    15 => "ffffff",
    2 => "93f91d",
    3 => "ffd00a",
    4 => "004f9e",
    5 => "ec0048",
    6 => "2aa7e7",
    7 => "ffffff",
    8 => "1d202f",
    9 => "ffffff"
  },
  reasons => {
    0 => "1B1D1E",
    1 => "F92672",
    10 => "BEED5F",
    11 => "E6DB74",
    12 => "66D9EF",
    13 => "9E6FFE",
    14 => "A3BABF",
    15 => "F8F8F2",
    2 => "A6E22E",
    3 => "FD971F",
    4 => "66D9EF",
    5 => "9E6FFE",
    6 => "5E7175",
    7 => "CCCCC6",
    8 => 505354,
    9 => "FF669D"
  },
  square => {
    0 => 171717,
    1 => "ea6868",
    10 => "9ead72",
    11 => "e7db52",
    12 => "66d9ef",
    13 => "ad7fa8",
    14 => "a3babf",
    15 => "e2e2e2",
    2 => "b6e77d",
    3 => "dbbb4b",
    4 => "66d9ef",
    5 => "75507b",
    6 => "5e7175",
    7 => "f2f2f2",
    8 => 554444,
    9 => "ff7272"
  },
  supertrain => {
    0 => "1C1C1C",
    1 => "D81860",
    10 => "BDE077",
    11 => "FFE863",
    12 => "AACCBB",
    13 => "BB4466",
    14 => "A3BABF",
    15 => "6C887A",
    2 => "B7CE42",
    3 => "FEA63C",
    4 => "66AABB",
    5 => "B7416E",
    6 => "5E7175",
    7 => "DDEEDD",
    8 => "4d4d4d",
    9 => "F00060"
  },
  tango => {
    0 => "2e3436",
    1 => "cc0000",
    10 => "8ae234",
    11 => "fce94f",
    12 => "729fcf",
    13 => "ad7fa8",
    14 => "00f5e9",
    15 => "eeeeec",
    2 => "4e9a06",
    3 => "c4a000",
    4 => "00AFFF",
    5 => "75507b",
    6 => "0b939b",
    7 => "d3d7cf",
    8 => 555753,
    9 => "ef2929"
  },
  tangoesque => {
    0 => "000000",
    1 => "ff6565",
    10 => "c8e7a8",
    11 => "ffc123",
    12 => "3465a4",
    13 => "f57900",
    14 => "46a4ff",
    15 => "ffffff",
    2 => "93d44f",
    3 => "eab93d",
    4 => "204a87",
    5 => "ce5c00",
    6 => "89b6e2",
    7 => "cccccc",
    8 => 555753,
    9 => "ff8d8d"
  },
  taters => {
    0 => "1C1C1C",
    1 => "D81860",
    10 => "BDE077",
    11 => "FFE863",
    12 => "AACCBB",
    13 => "BB4466",
    14 => "A3BABF",
    15 => "6C887A",
    2 => "B7CE42",
    3 => "FEA63C",
    4 => "66AABB",
    5 => "B7416E",
    6 => "5E7175",
    7 => "DDEEDD",
    8 => "4d4d4d",
    9 => "F00060"
  },
  thayer => {
    0 => "1b1d1e",
    1 => "f92672",
    10 => "b6e354",
    11 => "feed6c",
    12 => "8cedff",
    13 => "9e6ffe",
    14 => "899ca1",
    15 => "f8f8f2",
    2 => "82b414",
    3 => "fd971f",
    4 => "56c2d6",
    5 => "8c54fe",
    6 => 465457,
    7 => "ccccc6",
    8 => 505354,
    9 => "ff5995"
  },
  b52 => {
    0 => "1B1D1E",
    1 => "F92672",
    10 => "BEED5F",
    11 => "E6DB74",
    12 => "66D9EF",
    13 => "9E6FFE",
    14 => "A3BABF",
    15 => "F8F8F2",
    2 => "A6E22E",
    3 => "FD971F",
    4 => "66D9EF",
    5 => "9E6FFE",
    6 => "5E7175",
    7 => "CCCCC6",
    8 => 505354,
    9 => "FF669D"
  },
  c00kiez => {
    0 => 222222,
    1 => "F60606",
    10 => "93FF00",
    11 => "FFBF00",
    12 => "0071FF",
    13 => "B18CFE",
    14 => "A3BABF",
    15 => "FFFFFF",
    2 => "72F91D",
    3 => "FF971F",
    4 => "44A7EE",
    5 => "9E6FFE",
    6 => "5E7175",
    7 => "FFFFFF",
    8 => 454545,
    9 => "F60606"
  },
  drkwolf => {
    0 => 222222,
    1 => "EA6868",
    10 => "AFD78A",
    11 => "FFA75D",
    12 => "67CDE9",
    13 => "ECAEE9",
    14 => "36FFFC",
    15 => "FFFFFF",
    2 => "ABCB8D",
    3 => "E8AE5B",
    4 => "71C5F4",
    5 => "E2BAF1",
    6 => "21F1EA",
    7 => "F1F1F1",
    8 => 554444,
    9 => "FF7272"
  },
  freakcode => {
    0 => "000000",
    1 => "ff6565",
    10 => "c8e7a8",
    11 => "ffc123",
    12 => "3465a4",
    13 => "f57900",
    14 => "46a4ff",
    15 => "ffffff",
    2 => "93d44f",
    3 => "eab93d",
    4 => "204a87",
    5 => "ce5c00",
    6 => "89b6e2",
    7 => "cccccc",
    8 => 555753,
    9 => "ff8d8d"
  },
  jousi => {
    0 => 262729,
    1 => "F90670",
    10 => "D9FF6D",
    11 => "E6DB74",
    12 => "66A7FF",
    13 => "B18CFE",
    14 => "A3BABF",
    15 => "FFFFFF",
    2 => "BEED5F",
    3 => "FF971F",
    4 => "44A7EE",
    5 => "9E6FFE",
    6 => "88C9FF",
    7 => "FFFFFF",
    8 => "3F3F3F",
    9 => "FF669D"
  },
  jstandler => {
    0 => "000000",
    1 => "A80000",
    10 => "ED254F",
    11 => "ED254F",
    12 => "5054F8",
    13 => "ED254F",
    14 => "50FCF8",
    15 => "F8FCF8",
    2 => "ED254F",
    3 => "A85400",
    4 => "020202",
    5 => "A800A8",
    6 => "00A8A8",
    7 => "A8A8A8",
    8 => 545054,
    9 => "F85450"
  },
  leosolaris => {
    0 => "000000",
    1 => "A80000",
    10 => "50FC50",
    11 => "F2FC50",
    12 => "5054F8",
    13 => "F854F8",
    14 => "50FCF8",
    15 => "F8FCF8",
    2 => "00A800",
    3 => "A85400",
    4 => "0000A8",
    5 => "A800A8",
    6 => "00A8A8",
    7 => "A8A8A8",
    8 => 545054,
    9 => "F85450"
  },
  librec00kiez => {
    0 => 222222,
    1 => "c5000b",
    10 => "aecf00",
    11 => "ff950e",
    12 => "0066cc",
    13 => "d11793",
    14 => "A3BABF",
    15 => "FFFFFF",
    2 => "579d1c",
    3 => "ff420e",
    4 => "004586",
    5 => "9932CC",
    6 => "5E7175",
    7 => "FFFFFF",
    8 => 454545,
    9 => "ff0000"
  },
  mattikus => {
    0 => "1C1C1C",
    1 => "D81860",
    10 => "BDE077",
    11 => "FFE863",
    12 => "AACCBB",
    13 => "BB4466",
    14 => "A3BABF",
    15 => "6C887A",
    2 => "B7CE42",
    3 => "FEA63C",
    4 => "66AABB",
    5 => "B7416E",
    6 => "5E7175",
    7 => "DDEEDD",
    8 => "4d4d4d",
    9 => "F00060"
  },
  mmso2 => {
    0 => "030303",
    1 => "ff4747",
    10 => "b2c470",
    11 => "efbd5c",
    12 => "2a7cff",
    13 => "bd6cce",
    14 => "7fc4a4",
    15 => "ffffff",
    2 => "a8e134",
    3 => "ffb400",
    4 => "0066ee",
    5 => "d237ad",
    6 => "18dfb0",
    7 => "dedede",
    8 => "1c1c1c",
    9 => "ff6767"
  },
  sicpsnake => {
    0 => 292929,
    1 => "DE6951",
    10 => "9dbf60",
    11 => "EC8A25",
    12 => "5495DC",
    13 => "E41F66",
    14 => "276CC2",
    15 => "ffffff",
    2 => "bcda55",
    3 => "E2A564",
    4 => "2187F6",
    5 => "875C8D",
    6 => "4390B1",
    7 => "D2D2D2",
    8 => "3d3d3d",
    9 => "c56a47"
  },
  smurnjiff => {
    0 => "2e3436  ",
    1 => "cc0000 ",
    10 => "66ff66 ",
    11 => "fc394f ",
    12 => "729fcf ",
    13 => "ad7fa8 ",
    14 => "34e2e2",
    15 => "eeeeec ",
    2 => "00ff00 ",
    3 => "c4a000 ",
    4 => "3456a4",
    5 => "75507b",
    6 => 418179,
    7 => "d3d7cf ",
    8 => "555753 ",
    9 => "ef2929 "
  },

  "square" => {
    0 => "2e3436",
    1 => "cc0000",
    10 => "8ae234",
    11 => "fce94f",
    12 => "729fcf",
    13 => "ad7fa8",
    14 => "00f5e9",
    15 => "eeeeec",
    2 => "4e9a06",
    3 => "c4a000",
    4 => "3465a4",
    5 => "75507b",
    6 => "0b939b",
    7 => "d3d7cf",
    8 => 555753,
    9 => "ef2929"
  },

  whordijk => {
    0 => "1E2320",
    1 => 705050,
    10 => "c3bf9f",
    11 => "f0dfaf",
    12 => "94bff3",
    13 => "ec93d3",
    14 => "93e0e3",
    15 => "ffffff",
    2 => "60b48a",
    3 => "dfaf8f",
    4 => 506070,
    5 => "dc8cc3",
    6 => "8cd0d3",
    7 => "dcdccc",
    8 => 709080,
    9 => "dca3a3"
  },

  rasi2     => {
    0  => "1B1D1E",
    8  => "505354",

    1  => "F92672",
    9  => "FF5995",

    2  => "82B414",
    10 => "B6E354",

    3  => "FD971F",
    11 => "FEED6C",
    4  => "4E82AA",
    12 => "0C73C2",

    5  => "8C54FE",
    13 => "9E6FFE",

    6  => "465457",
    14 => "899CA1",
    7  => "CCCCC6",
    15 => "F8F8F2",
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

    use Term::ExtendedColor::TTY qw(set_tty_color);
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

=head1 CONTRIBUTORS

None required yet.

=head1 COPYRIGHT

Copyright 2010, 2011 the B<Term::ExtendedColor::TTY::Colorschemes> L</AUTHOR>
and L</CONTRIBUTORS> as listed above.

=head1 LICENSE

This library is free software; you may redistribute it and/or modify it under
the same terms as Perl itself.

=cut
