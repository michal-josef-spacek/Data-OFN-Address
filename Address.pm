package Data::OFN::Address;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is);
use Mo::utils 0.21 qw(check_array_object check_number check_regexp check_strings);
use Readonly;
use Unicode::UTF8 qw(decode_utf8);

Readonly::Array our @HOUSE_NUMBER_TYPES => (
	decode_utf8('č.p.'),
	decode_utf8('č.ev.'),
);

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
	default => [],
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

	# Check house_number_type.
	check_strings($self, 'house_number_type', \@HOUSE_NUMBER_TYPES);

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
 my $address_place = $obj->address_place;
 my $address_place_code = $obj->address_place_code;
 my $cadastral_area = $obj->cadastral_area;
 my $cadastral_area_name = $obj->cadastral_area_name;
 my $conscription_number = $obj->conscription_number;
 my $conscription_number_flag = $obj->conscription_number_flag;
 my $district = $obj->district;
 my $district_name = $obj->district_name;
 my $element_ruian = $obj->element_ruian;
 my $house_number = $obj->house_number;
 my $house_number_type = $obj->house_number_type;
 my $id = $obj->id;
 my $momc = $obj->momc;
 my $momc_name = $obj->momc_name;
 my $mop = $obj->mop;
 my $mop_name = $obj->mop_name;
 my $name = $obj->name;
 my $municipality = $obj->municipality;
 my $municipality_name = $obj->municipality_name;
 my $municipality_part = $obj->municipality_part;
 my $municipality_part_name = $obj->municipality_part_name;
 my $psc = $obj->psc;
 my $street = $obj->street;
 my $street_name = $obj->street_name;
 my $text = $obj->text;
 my $vusc = $obj->vusc;
 my $vusc_name = $obj->vusc_name;

=head1 METHODS

=head2 C<new>

 my $obj = Data::OFN::Address->new(%params);

Constructor.

=over 8

=item * C<address_place>

TODO

It's optional.

=item * C<address_place_code>

TODO

It's optional.

=item * C<cadastral_area>

TODO

It's optional.

=item * C<cadastral_area_name>

TODO

It's optional.

=item * C<conscription_number>

TODO

It's optional.

=item * C<conscription_number_flag>

TODO

It's optional.

=item * C<district>

TODO

It's optional.

=item * C<district_name>

TODO

It's optional.

=item * C<element_ruian>

TODO

It's optional.

=item * C<house_number>

TODO

It's optional.

=item * C<house_number_type>

TODO

It's optional.

=item * C<id>

TODO

It's optional.

=item * C<momc>

TODO

It's optional.

=item * C<momc_name>

TODO

It's optional.

=item * C<mop>

TODO

It's optional.

=item * C<mop_name>

TODO

It's optional.

=item * C<name>

Address name.

It's optional.

=item * C<municipality>

TODO

It's optional.

=item * C<municipality_name>

TODO

It's optional.

=item * C<municipality_part>

TODO

It's optional.

=item * C<municipality_part_name>

TODO

It's optional.

=item * C<psc>

TODO

It's optional.

=item * C<street>

TODO

It's optional.

=item * C<street_name>

TODO

It's optional.

=item * C<text>

TODO

It's optional.

=item * C<vusc>

TODO

It's optional.

=item * C<vusc_name>

TODO

It's optional.

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

© 2023-2024 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
