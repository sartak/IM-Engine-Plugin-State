package IM::Engine::Plugin::State::InMemory;
use Moose;
extends 'IM::Engine::Plugin::State';

has state => (
    is      => 'ro',
    isa     => 'HashRef',
    default => sub { {} },
);

sub _canonicalize_user { $_[1]->canonical_name }

sub get_user_state {
    my $self = shift;
    my $user = $self->_canonicalize_user(shift);
    my $key  = shift;

    confess "You must provide a key to avoid collisions"
        if !defined($key);

    return $self->state->{$user}->{$key};
}

sub set_user_state {
    my $self = shift;
    my $user = $self->_canonicalize_user(shift);
    my $key  = shift;
    my $new  = shift;

    confess "You must provide a key to avoid collisions"
        if !defined($key);

    return $self->state->{$user}->{$key} = $new;
}

sub has_user_state {
    my $self = shift;
    my $user = $self->_canonicalize_user(shift);
    my $key  = shift;

    confess "You must provide a key to avoid collisions"
        if !defined($key);

    return exists($self->state->{$user}->{$key});
}

sub clear_user_state {
    my $self = shift;
    my $user = $self->_canonicalize_user(shift);
    my $key  = shift;

    confess "You must provide a key to avoid collisions"
        if !defined($key);

    return delete($self->state->{$user}->{$key});
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 NAME

IM::Engine::Plugin::State - Keep track of some state for each user

=head1 SYNOPSIS


=head1 DESCRIPTION


=head1 AUTHOR

Shawn M Moore, C<sartak@gmail.com>

=head1 SEE ALSO

=over 4

=item L<IM::Engine>

=back

=head1 COPYRIGHT AND LICENSE

Copyright 2009 Shawn M Moore.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

