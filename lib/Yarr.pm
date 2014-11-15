use strict;
use warnings;
package Yarr;

use Carp 'croak';
use Module::Loader;

my %HANDLERS;

BEGIN {
    my $loader = Module::Loader->new();
    my @plugins = $loader->find_modules('Yarr');
    foreach my $pkg (@plugins)
    {
        $loader->load($pkg);
    }
}

sub register
{
    my (undef, $type, $class) = @_;
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
