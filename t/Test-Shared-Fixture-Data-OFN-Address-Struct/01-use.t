use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Test::Shared::Fixture::Data::OFN::Address::Struct');
}

# Test.
require_ok('Test::Shared::Fixture::Data::OFN::Address::Struct');
