package EPrints::Plugin::Screen::EPrint::SimplePubsEdit;

@ISA = ( 'EPrints::Plugin::Screen::EPrint::Edit' );

use strict;

sub workflow_id
{
	my ( $self ) = @_;

	my $repo = $self->{repository};

	if ( $repo->can_call("simple_pubs_choose_workflow") )
	{
		return $repo->call("simple_pubs_choose_workflow", $self->{processor}->{eprint} );
	}

	return "default";
}
