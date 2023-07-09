package Data::OFN::Address;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_array_object check_number check_string_begin);

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
	# XXX Check number after this string.
	check_string_begin($self, 'address_place',
		'https://linked.cuzk.cz/resource/ruian/adresni-misto/');

	# Check address_place_code.
	check_number($self, 'address_place_code');

	# Check cadastral_area.
	# XXX Check number after this string.
	check_string_begin($self, 'cadastral_area',
		'https://linked.cuzk.cz/resource/ruian/katastralni-uzemi/');

	# Check cadastral_area_name.
	check_array_object($self, 'cadastral_area_name', 'Data::Text::Simple');

	# Check district.
	# XXX Check number after this string.
	check_string_begin($self, 'district',
		'https://linked.cuzk.cz/resource/ruian/okres/');

	# Check district_name.
	check_array_object($self, 'district_name', 'Data::Text::Simple');

	# Check element_ruian.
	# XXX Check number after this string.
	check_string_begin($self, 'element_ruian',
		'https://linked.cuzk.cz/resource/ruian/parcela/');

	# Check district.
	# XXX Check number after this string.
	check_string_begin($self, 'district',
		'https://linked.cuzk.cz/resource/ruian/okres/');

	# Check id.
	check_number($self, 'id');

	# Check momc.
	# XXX Check number after this string.
	check_string_begin($self, 'momc',
		'https://linked.cuzk.cz/resource/ruian/momc/');

	# Check momc_name.
	check_array_object($self, 'momc_name', 'Data::Text::Simple');

	# Check mop.
	# XXX Check number after this string.
	check_string_begin($self, 'mop',
		'https://linked.cuzk.cz/resource/ruian/mop/');

	# Check mop_name.
	check_array_object($self, 'mop_name', 'Data::Text::Simple');

	# Check municipality.
	# XXX Check number after this string.
	check_string_begin($self, 'municipality',
		'https://linked.cuzk.cz/resource/ruian/obec/');

	# Check municipality_name.
	check_array_object($self, 'municipality_name', 'Data::Text::Simple');

	# Check municipality_part.
	# XXX Check number after this string.
	check_string_begin($self, 'municipality_part',
		'https://linked.cuzk.cz/resource/ruian/cast-obce/');

	# Check municipality_part_name.
	check_array_object($self, 'municipality_part_name', 'Data::Text::Simple');

	# Check street.
	# XXX Check number after this string.
	check_string_begin($self, 'street',
		'https://linked.cuzk.cz/resource/ruian/ulice/');

	# Check street_name.
	check_array_object($self, 'street_name', 'Data::Text::Simple');

	# Check text.
	check_array_object($self, 'text', 'Data::Text::Simple');

	# Check vusc.
	# XXX Check number after this string.
	check_string_begin($self, 'vusc',
		'https://linked.cuzk.cz/resource/ruian/vusc/');

	# Check vusc_name.
	check_array_object($self, 'vusc', 'Data::Text::Simple');

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::OFN::Address - Data object for catalog.

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

L<https://github.com/michal-josef-spacek/Data-Address>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
