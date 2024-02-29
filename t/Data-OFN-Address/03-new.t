use strict;
use warnings;

use Data::OFN::Address;
use Data::Text::Simple;
use English;
use Error::Pure::Utils qw(clean);
use Test::MockObject;
use Test::More 'tests' => 12;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::OFN::Address->new;
isa_ok($obj, 'Data::OFN::Address');

# Test.
$obj = Data::OFN::Address->new(
	'address_place' => 'https://linked.cuzk.cz/resource/ruian/adresni-misto/123',
	'address_place_code' => 123,
	'cadastral_area' => 'https://linked.cuzk.cz/resource/ruian/katastralni-uzemi/123',
	'cadastral_area_name' => [Data::Text::Simple->new(
		'lang' => 'cs',
		'text' => decode_utf8('Katastrální území'),
	)],
	'conscription_number' => 123,
	'conscription_number_flag' => 'a',
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
