#!/usr/bin/env perl
use strict;
use warnings;
use IM::Engine;
use Test::More tests => 7;
use Test::Exception;

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

throws_ok {
    $user->get_state;
} qr/You must provide a key to avoid collisions/;

throws_ok {
    $user->set_state;
} qr/You must provide a key to avoid collisions/;

throws_ok {
    $user->has_state;
} qr/You must provide a key to avoid collisions/;

throws_ok {
    $user->clear_state;
} qr/You must provide a key to avoid collisions/;
