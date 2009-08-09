#!/usr/bin/env perl
use strict;
use warnings;
use IM::Engine;
use Test::More tests => 3;

my $user;
my $engine = IM::Engine->new(
    interface => {
        protocol => 'CLI',
        incoming_callback => sub {
            my $incoming = shift;
            $user = $incoming->sender;
        },
    },
    plugins => ['State::InMemory'],
);

$engine->run("hello");
isa_ok($user, 'IM::Engine::User');
ok($user->does('IM::Engine::Plugin::State::Trait::User::WithState'), 'user does IM::Engine::Plugin::State::Trait::User::WithState');
can_ok($user => qw(get_state set_state clear_state has_state));

