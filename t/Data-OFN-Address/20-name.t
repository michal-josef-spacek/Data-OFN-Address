use strict;
use warnings;

use Data::Text::Simple;
use Data::OFN::Address;
use Test::More 'tests' => 5;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::OFN::Address->new;
is_deeply($obj->name, [], 'Get name (undef - default).');

# Test.
$obj = Data::OFN::Address->new(
	'name' => [
		Data::Text::Simple->new(
			'lang' => 'cs',
			'text' => decode_utf8('Jméno'),
		),
	],
);
isa_ok($obj->name->[0], 'Data::Text::Simple');
is($obj->name->[0]->lang, 'cs',
	'Get name language (cs).');
is(
	$obj->name->[0]->text,
	decode_utf8('Jméno'),
	'Get name (Jméno).',
);
