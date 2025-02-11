package Test::Shared::Fixture::Data::OFN::Address::String;

use base qw(Data::OFN::Address);
use strict;
use warnings;

use Data::Text::Simple;
use Unicode::UTF8 qw(decode_utf8);

our $VERSION = 0.01;

sub new {
	my $class = shift;

	my @params = (
		'text' => [
			Data::Text::Simple->new(
				'lang' => 'cs',
				'text' => decode_utf8('Pod Panskou strání 262/12, Chvojkonosy, 33205 Lysostírky'),
			),
		],
	);

	my $self = $class->SUPER::new(@params);

	return $self;
}

1;

__END__
