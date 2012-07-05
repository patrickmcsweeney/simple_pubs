$c->{plugin_alias_map}->{"Screen::EPrint::Edit"} = "Screen::EPrint::SimplePubsEdit";
$c->{plugin_alias_map}->{"Screen::EPrint::SimplePubsEdit"} = undef;
$c->{plugins}->{"Screen::EPrint::SimplePubsEdit"}->{params}->{disable} = 0;

$c->{set_eprint_defaults} = sub
{
        my( $data, $repository ) = @_;

        $data->{type} = "article";

	my $user = $repository->current_user;
        if(defined $user)
        {
                my %creator;
                $creator{name} = $user->get_value("name");
                $creator{id} = $user->get_value("email");
                my @creators;
                $creators[0] = \%creator;
                $data->{creators} = \@creators;
        }

};

$c->{"simple_pubs_choose_workflow"} = sub {
        my ( $eprint ) = @_;

        return "simple_pubs";

};

