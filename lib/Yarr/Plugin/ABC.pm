use strict;
use warnings;
package Yarr::Plugin::ABC;

use base qw(Yarr);

__PACKAGE__->register('ABC');

sub process
{
    my ($class, $message) = @_;
    print "Handling ABC $message with Yarr::ABC. Woo?\n";
    return 1;
}

1;
