use strict;
use warnings;
package Yarr::ABC;

use base qw(Yarr);

__PACKAGE__->register(ABC => 'Yarr::ABC');

sub process
{
    my ($class, $message) = @_;
    print "Handling ABC $message with Yarr::ABC. Woo?\n";
    return 1;
}

1;
