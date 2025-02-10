package Data::OFN::Address;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build default is);
use Mo::utils 0.22 qw(check_array_object check_length_fix check_number check_regexp
	check_strings);
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

	# Check psc.
	check_length_fix($self, 'psc', 5);
	check_regexp($self, 'psc', qw{^\d+$});

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
	check_array_object($self, 'vusc_name', 'Data::Text::Simple', 'VUSC name');

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

Czech address place IRI.

IRI has format https://linked.cuzk.cz/resource/ruian/adresni-misto/ and unique
number on the end.

It's optional.

=item * C<address_place_code>

Czech address place numeric code.
Same number as on the C<address_place> end.

It's optional.

=item * C<cadastral_area>

Czech address cadastral area IRI.

IRI has format https://linked.cuzk.cz/resource/ruian/katastralni-uzemi/ and
unique number on the end.

It's optional.

=item * C<cadastral_area_name>

Czech address cadastral area name(s).
This name is in form of reference to array of L<Data::Text::Simple> instances
with language definition.

It's optional.

Default value is [].

=item * C<conscription_number>

Czech address consciption number.

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

Default value is [].

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

Default value is [].

=item * C<mop>

TODO

It's optional.

=item * C<mop_name>

TODO

It's optional.

=item * C<municipality>

TODO

It's optional.

=item * C<municipality_name>

TODO

Default value is [].

It's optional.

=item * C<municipality_part>

TODO

It's optional.

=item * C<municipality_part_name>

TODO

Default value is [].

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

Default value is [].

=item * C<text>

TODO

It's optional.

Default value is [].

=item * C<vusc>

TODO

It's optional.

=item * C<vusc_name>

TODO

It's optional.

Default value is [].

=back

Returns instance of object.

=head2 C<address_place>

 my $address_place = $obj->address_place;

TODO

=head2 C<address_place_code>

 my $address_place_code = $obj->address_place_code;

TODO

=head2 C<cadastral_area>

 my $cadastral_area = $obj->cadastral_area;

TODO

=head2 C<cadastral_area_name>

 my $cadastral_area_name = $obj->cadastral_area_name;

TODO

=head2 C<conscription_number>

 my $conscription_number = $obj->conscription_number;

TODO

=head2 C<conscription_number_flag>

 my $conscription_number_flag = $obj->conscription_number_flag;

TODO

=head2 C<district>

 my $district = $obj->district;

TODO

=head2 C<district_name>

 my $district_name = $obj->district_name;

TODO

=head2 C<element_ruian>

 my $element_ruian = $obj->element_ruian;

TODO

=head2 C<house_number>

 my $house_number = $obj->house_number;

TODO

=head2 C<house_number_type>

 my $house_number_type = $obj->house_number_type;

TODO

=head2 C<id>

 my $id = $obj->id;

Get OFN address id.

Returns number.

=head2 C<momc>

 my $momc = $obj->momc;

TODO

=head2 C<momc_name>

 my $momc_name = $obj->momc_name;

TODO

=head2 C<mop>

 my $mop = $obj->mop;

TODO

=head2 C<mop_name>

 my $mop_name = $obj->mop_name;

TODO

=head2 C<municipality>

 my $municipality = $obj->municipality;

TODO

=head2 C<municipality_name>

 my $municipality_name = $obj->municipality_name;

TODO

=head2 C<municipality_part>

 my $municipality_part = $obj->municipality_part;

TODO

=head2 C<municipality_part_name>

 my $municipality_part_name = $obj->municipality_part_name;

TODO

=head2 C<psc>

 my $psc = $obj->psc;

TODO

=head2 C<street>

 my $street = $obj->street;

TODO

=head2 C<street_name>

 my $street_name = $obj->street_name;

TODO

=head2 C<text>

 my $text = $obj->text;

TODO

=head2 C<vusc>

 my $vusc = $obj->vusc;

TODO

=head2 C<vusc_name>

 my $vusc_name = $obj->vusc_name;

TODO

=head1 ERRORS

 new():
         From Mo::utils:
                 Parameter 'id' must a number.
                         Value: %s

=head1 EXAMPLE

=for comment filename=create_and_print_ofn_address.pl

 use strict;
 use warnings;

 use Data::OFN::Address;
 use Data::Text::Simple;
 use Unicode::UTF8 qw(decode_utf8 encode_utf8);

 my $obj = Data::OFN::Address->new(
         'address_place' => 'https://linked.cuzk.cz/resource/ruian/adresni-misto/83163832',
         'address_place_code' => 83163832,
         'cadastral_area' => 'https://linked.cuzk.cz/resource/ruian/katastralni-uzemi/635448',
         'cadastral_area_name' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => 'Fulnek',
                 ),
         ],
         'conscription_number' => 123,
         'conscription_number_flag' => 'a',
         'district' => 'https://linked.cuzk.cz/resource/ruian/okres/3804',
         'district_name' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => decode_utf8('Nový Jičín'),
                 ),
         ],
         'element_ruian' => 'https://linked.cuzk.cz/resource/ruian/parcela/91188411010',
         'house_number' => 386,
         'house_number_type' => decode_utf8('č.p.'),
         'id' => 7,
         'municipality' => 'https://linked.cuzk.cz/resource/ruian/obec/599352',
         'municipality_name' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => 'Fulnek',
                 ),
         ],
         'municipality_part' => 'https://linked.cuzk.cz/resource/ruian/cast-obce/413551',
         'municipality_part_name' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => 'Fulnek',
                 ),
         ],
         'psc' => 74245,
         'street' => 'https://linked.cuzk.cz/resource/ruian/ulice/309184',
         'street_name' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => decode_utf8('Bílovecká'),
                 ),
         ],
         'text' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => decode_utf8('Bílovecká 386, 74245 Fulnek'),
                 ),
         ],
         'vusc' => 'https://linked.cuzk.cz/resource/ruian/vusc/132',
         'vusc_name' => [
                 Data::Text::Simple->new(
                         'lang' => 'cs',
                         'text' => decode_utf8('Moravskoslezský kraj'),
                 ),
         ],
 );

 sub _text {
         my $obj = shift;

         return encode_utf8($obj->text.' ('.$obj->lang.')');
 }

 # Print out.
 print 'Address place: '.$obj->address_place."\n";
 print 'Address place code: '.$obj->address_place_code."\n";
 print 'Cadastral area: '.$obj->cadastral_area."\n";
 print 'Cadastral area name: '._text($obj->cadastral_area_name->[0])."\n";
 print 'Conscription number: '.$obj->conscription_number."\n";
 print 'Conscription number flag: '.$obj->conscription_number_flag."\n";
 print 'District: '.$obj->district."\n";
 print 'District name: '._text($obj->district_name->[0])."\n";
 print 'Element RUIAN: '.$obj->element_ruian."\n";
 print 'House number: '.$obj->house_number."\n";
 print 'House number type: '.encode_utf8($obj->house_number_type)."\n";
 print 'Id: '.$obj->id."\n";
 print 'Municipality: '.$obj->municipality."\n";
 print 'Municipality name: '._text($obj->municipality_name->[0])."\n";
 print 'Municipality part: '.$obj->municipality_part."\n";
 print 'Municipality part name: '._text($obj->municipality_part_name->[0])."\n";
 print 'PSC: '.$obj->psc."\n";
 print 'Street: '.$obj->street."\n";
 print 'Street name: '._text($obj->street_name->[0])."\n";
 print 'Text: '._text($obj->text->[0])."\n";
 print 'VUSC: '.$obj->vusc."\n";
 print 'VUSC name: '._text($obj->vusc_name->[0])."\n";

 # Output:
 # Address place: https://linked.cuzk.cz/resource/ruian/adresni-misto/83163832
 # Address place code: 83163832
 # Cadastral area: https://linked.cuzk.cz/resource/ruian/katastralni-uzemi/635448
 # Cadastral area name: Fulnek (cs)
 # Conscription number: 123
 # Conscription number flag: a
 # District: https://linked.cuzk.cz/resource/ruian/okres/3804
 # District name: Nový Jičín (cs)
 # Element RUIAN: https://linked.cuzk.cz/resource/ruian/parcela/91188411010
 # House number: 386
 # House number type: č.p.
 # Id: 7
 # Municipality: https://linked.cuzk.cz/resource/ruian/obec/599352
 # Municipality name: Fulnek (cs)
 # Municipality part: https://linked.cuzk.cz/resource/ruian/cast-obce/413551
 # Municipality part name: Fulnek (cs)
 # PSC: 74245
 # Street: https://linked.cuzk.cz/resource/ruian/ulice/309184
 # Street name: Bílovecká (cs)
 # Text: Bílovecká 386, 74245 Fulnek (cs)
 # VUSC: https://linked.cuzk.cz/resource/ruian/vusc/132
 # VUSC name: Moravskoslezský kraj (cs)

=head1 DEPENDENCIES

L<Error::Pure>
L<Mo>,
L<Mo::utils>,
L<Readonly>,
L<Unicode::UTF8>.

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
