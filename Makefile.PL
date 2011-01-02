use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Term::ExtendedColor::TTY',
    AUTHOR              => q{Magnus Woldrich <trapd00r@trapd00r.se>},
    VERSION_FROM        => 'lib/Term/ExtendedColor/TTY.pm',
    ABSTRACT_FROM       => 'lib/Term/ExtendedColor/TTY.pm',

    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),

    PL_FILES            => {},

    PREREQ_PM           => {
      'Test::More'     => 0,
    },

    MIN_PERL_VERSION    => 0,

    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Term-ExtendedColor-TTY*' },
);
