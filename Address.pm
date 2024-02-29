package Data::OFN::Address;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is);
use Mo::utils qw(check_array_object check_number check_regexp);

our $VERSION = 0.01;

has address_place => (
	is => 'ro',
);

has address_place_code => (
	is => 'ro',
);

has cadastral_area => (
	is => 'ro',
);

has cadastral_area_name => (
	default => [],
	is => 'ro',
);

has conscription_number => (
	is => 'ro',
);

has conscription_number_flag => (
	is => 'ro',
);

has district => (
	is => 'ro',
);

has district_name => (
	default => [],
	is => 'ro',
);

has element_ruian => (
	is => 'ro',
);

has house_number => (
	is => 'ro',
);

has house_number_type => (
	is => 'ro',
);

has id => (
	is => 'ro',
);

has momc => (
	is => 'ro',
);

has momc_name => (
	is => 'ro',
);

has mop => (
	is => 'ro',
);

has mop_name => (
	default => [],
	is => 'ro',
);

has name => (
	default => [],
	is => 'ro',
);

has municipality => (
	is => 'ro',
);

has municipality_name => (
	default => [],
	is => 'ro',
);

has municipality_part => (
	is => 'ro',
);

has municipality_part_name => (
	default => [],
	is => 'ro',
);

has psc => (
	is => 'ro',
);

has street => (
	is => 'ro',
);

has street_name => (
	default => [],
	is => 'ro',
);

has text => (
	default => [],
	is => 'ro',
);

has vusc => (
	is => 'ro',
);

has vusc_name => (
	default => [],
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check address_place.
	check_regexp($self, 'address_place',
		qr{^https://linked\.cuzk\.cz/resource/ruian/adresni-misto/\d+$});

	# Check address_place_code.
	check_number($self, 'address_place_code');

	# Check cadastral_area.
	check_regexp($self, 'cadastral_area',
		qr{^https://linked\.cuzk\.cz/resource/ruian/katastralni-uzemi/\d+$});

	# Check cadastral_area_name.
	check_array_object($self, 'cadastral_area_name', 'Data::Text::Simple',
		'Cadastral area name');

	# Check conscription_number.
	check_number($self, 'conscription_number');

	# Check conscription_number_flag.
	if (! defined $self->{'conscription_number'}
		&& defined $self->{'conscription_number_flag'}) {

		err "Parameter 'conscription_number_flag' is possible with 'conscription_number' parameter only.";
	}

	# Check district.
	check_regexp($self, 'district',
		qr{^https://linked\.cuzk\.cz/resource/ruian/okres/\d+});

	# Check district_name.
	check_array_object($self, 'district_name', 'Data::Text::Simple',
		'District name');

	# Check element_ruian.
	check_regexp($self, 'element_ruian',
		qr{^https://linked\.cuzk\.cz/resource/ruian/parcela/\d+$});

	# Check district.
	check_regexp($self, 'district',
		qr{^https://linked\.cuzk\.cz/resource/ruian/okres/\d+$});

	# Check id.
	check_number($self, 'id');

	# Check momc.
	check_regexp($self, 'momc',
		qr{^https://linked\.cuzk\.cz/resource/ruian/momc/\d+$});

	# Check momc_name.
	check_array_object($self, 'momc_name', 'Data::Text::Simple', 'MOMC name');

	# Check mop.
	check_regexp($self, 'mop',
		qr{^https://linked\.cuzk\.cz/resource/ruian/mop/\d+$});

	# Check mop_name.
	check_array_object($self, 'mop_name', 'Data::Text::Simple', 'MOP name');

	# Check municipality.
	check_regexp($self, 'municipality',
		qr{^https://linked\.cuzk\.cz/resource/ruian/obec/\d+$});

	# Check municipality_name.
	check_array_object($self, 'municipality_name', 'Data::Text::Simple',
		'Municipality name');

	# Check municipality_part.
	check_regexp($self, 'municipality_part',
		qr{^https://linked\.cuzk\.cz/resource/ruian/cast-obce/\d+$});

	# Check municipality_part_name.
	check_array_object($self, 'municipality_part_name', 'Data::Text::Simple', 'Municipality part name');

	# Check street.
	check_regexp($self, 'street',
		qr{^https://linked\.cuzk\.cz/resource/ruian/ulice/\d+$});

	# Check street_name.
	check_array_object($self, 'street_name', 'Data::Text::Simple',
		'Street name');

	# Check text.
	check_array_object($self, 'text', 'Data::Text::Simple', 'Text');

	# Check vusc.
	check_regexp($self, 'vusc',
		qr{^https://linked\.cuzk\.cz/resource/ruian/vusc/\d+$});

	# Check vusc_name.
	check_array_object($self, 'vusc', 'Data::Text::Simple', 'VUSC');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::OFN::Address - Data object for OFN address.

=head1 SYNOPSIS

 use Data::OFN::Address;

 my $obj = Data::OFN::Address->new(%params);
 # TODO 

=head1 METHODS

=head2 C<new>

 my $obj = Data::OFN::Address->new(%params);

Constructor.

=over 8

=item * C<items>

Address item objects. Each item must be a L<Data::Catalog::Item> object.
It's optional.
Default value is [].

=item * C<name>

Address name.
It's required.

=back

Returns instance of object.

=head2 C<TODO>

TODO

=head1 EXAMPLE

=for comment filename=create_and_print_ofn_address.pl

 use strict;
 use warnings;

 use Data::OFN::Address;

 my $obj = Data::OFN::Address->new(
 );

 # Print out.
 # print 'Name: '.$obj->name."\n";

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Mo>,
L<Mo::utils>.

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Data-OFN-Address>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
