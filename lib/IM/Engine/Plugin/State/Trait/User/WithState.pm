package IM::Engine::Plugin::State::Trait::User::WithState;
use Moose::Role;

has state_plugin => (
    is       => 'ro',
    isa      => 'IM::Engine::Plugin::State',
    required => 1,
    handles  => {
        get_state   => 'get_user_state',
        set_state   => 'set_user_state',
        clear_state => 'clear_user_state',
        has_state   => 'has_user_state',
    },
);

1;

