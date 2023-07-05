package Data::OFN::Address;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_length check_number check_string_begin);

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
	is => 'ro',
);

has text => (
	is => 'ro',
);

has vusc => (
	is => 'ro',
);

has vusc_name => (
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

	# Check element_ruian.
	# XXX Check number after this string.
	check_string_begin($self, 'element_ruian',
		'https://linked.cuzk.cz/resource/ruian/parcela/');

	# Check district.
	# XXX Check number after this string.
	check_string_begin($self, 'district',
		'https://linked.cuzk.cz/resource/ruian/okres/');

	# Check momc.
	# XXX Check number after this string.
	check_string_begin($self, 'momc',
		'https://linked.cuzk.cz/resource/ruian/momc/');

	# Check vusc.
	# XXX Check number after this string.
	check_string_begin($self, 'vusc',
		'https://linked.cuzk.cz/resource/ruian/vusc/');

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
