#!/usr/bin/env perl
use Yarr;

Yarr->process('ABC', "abc message");
Yarr->process('GTA', "gta message");

# croaks
Yarr->process('MEH', 'badger badger');
