use strict;
use warnings;
use utf8;
use Test::Tester;
use Test::More tests => 8;
use File::Temp;
use Test::MinimumVersion::Fast;

my $tmp = File::Temp->new(UNLINK => 1);
print {$tmp} '...';
 
minimum_version_ok($tmp->filename, '5.012');
 
check_test(
  sub {
    minimum_version_ok($tmp->filename, '5.012');
  },
  {
    ok   => 1,
    name => $tmp->filename,
    diag => '',
  },
  "successful comparison"
);

