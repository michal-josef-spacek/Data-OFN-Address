use strict;
use warnings;

use Data::OFN::Address;
use Data::Text::Simple;
use English;
use Error::Pure::Utils qw(clean);
use Test::MockObject;
use Test::More 'tests' => 13;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::OFN::Address->new;
isa_ok($obj, 'Data::OFN::Address');

# Test.
$obj = Data::OFN::Address->new(
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
);
isa_ok($obj, 'Data::OFN::Address');

# Test.
eval {
	Data::OFN::Address->new(
		'address_place' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'address_place' does not match the specified regular expression.\n",
	"Parameter 'address_place' does not match the specified regular expression.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'address_place' => 'https://linked.cuzk.cz/resource/ruian/adresni-misto/foo',
	);
};
is($EVAL_ERROR, "Parameter 'address_place' does not match the specified regular expression.\n",
	"Parameter 'address_place' does not match the specified regular expression.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'address_place_code' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'address_place_code' must be a number.\n",
	"Parameter 'address_place_code' must be a number.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'cadastral_area' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'cadastral_area' does not match the specified regular expression.\n",
	"Parameter 'cadastral_area' does not match the specified regular expression.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'cadastral_area' => 'https://linked.cuzk.cz/resource/ruian/katastralni-uzemi/foo',
	);
};
is($EVAL_ERROR, "Parameter 'cadastral_area' does not match the specified regular expression.\n",
	"Parameter 'cadastral_area' does not match the specified regular expression.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'cadastral_area_name' => ['bad'],
	);
};
is($EVAL_ERROR, "Cadastral area name isn't 'Data::Text::Simple' object.\n",
	"Cadastral area name isn't 'Data::Text::Simple' object.");
clean();

# Test.
my $mock = Test::MockObject->new;
eval {
	Data::OFN::Address->new(
		'cadastral_area_name' => [$mock],
	);
};
is($EVAL_ERROR, "Cadastral area name isn't 'Data::Text::Simple' object.\n",
	"Cadastral area name isn't 'Data::Text::Simple' object.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'conscription_number' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'conscription_number' must be a number.\n",
	"Parameter 'conscription_number' must be a number.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'conscription_number_flag' => 'a',
	);
};
is($EVAL_ERROR, "Parameter 'conscription_number_flag' is possible with 'conscription_number' parameter only.\n",
	"Parameter 'conscription_number_flag' is possible with 'conscription_number' parameter only.");
clean();

# Test.
eval {
	Data::OFN::Address->new(
		'element_ruian' => '91188411010',
	);
};
is($EVAL_ERROR, "Parameter 'element_ruian' does not match the specified regular expression.\n",
	"Parameter 'element_ruian' does not match the specified regular expression.");
clean();
