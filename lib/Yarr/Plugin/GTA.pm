use strict;
use warnings;
package Yarr::Plugin::GTA;

use base qw(Yarr);
__PACKAGE__->register('GTA');

sub process
{
    my ($class, $message) = @_;
    print "Handling GTA $message with Yarr::GTA. And so it goes.\n";
    return 1;
}

1;
