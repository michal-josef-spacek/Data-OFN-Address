package Test::Shared::Fixture::Data::OFN::Address::Place;

use base qw(Data::OFN::Address);
use strict;
use warnings;

our $VERSION = 0.01;

sub new {
	my $class = shift;

	my @params = (
		'address_place' => 'https://linked.cuzk.cz/resource/ruian/adresni-misto/16135661',
	);

	my $self = $class->SUPER::new(@params);

	return $self;
}

1;

__END__
