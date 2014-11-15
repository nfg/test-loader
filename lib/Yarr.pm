use strict;
use warnings;
package Yarr;

use Carp 'croak';
use Module::Find;
use Data::Printer;

# Load plugins
my @found = useall 'Yarr::Plugin';
print STDERR "Loaded plugins: " . p(@found) . "\n";

my %HANDLERS;
sub register
{
    my ($class, $type) = @_;
    croak qq(Loading two modules that handle type "$type" -- WTF?)
        if exists $HANDLERS{$type};
    $HANDLERS{$type} = $class;
}

sub process
{
    my ($self, $type, $message) = @_;
    return $HANDLERS{$type}->process($message)
        if exists $HANDLERS{$type};
    croak qq(No handler loaded for type "$type".);
}

1;
