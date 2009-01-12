# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Unicode-Property-XS.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 2;
BEGIN { use_ok( 'Unicode::Property::XS', qw(:all) ) };
#use Unicode::Property::XS qw(:all);

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $LOG = 0;

my $okey;
my $okey2;
my @ords = 1..0xd7ff; #(0x0000..0xd7ff, 0xE000..0xFFFD, 0xE0001..0xE01EF);
my @ords_original = @ords;

$_ = 'a';
my $val  = ( /\p{L}/ ) ? 1 : 0;
my $val2 = ucs_L(ord('a'));
ok( $val == $val2 , "First test.");

##### Scalar Test #####
# $LOG && (open TEST, ">test_scalar.log");
# $okey = 1;
# for my $ord (@ords) {
#     my $ord2 = $ord;
#     next if (!ucs_Legal($ord2));
#     $_ = chr($ord);
#     my $val = ( /\p{L}/ ) ? 1 : 0;
#     my $val2 = ucs_L($ord) ;
#     $LOG && (print TEST "#$ord:($val,$val2)\n");
#     # my $val = 1;
#     $okey = 0 if ( $val != $val2 );
#     die if !defined( $ord );
# };
# $LOG && (close TEST);
# 
# $okey2 = 1;
# for my $i (0..$#ords_original) {
#     $okey2 = 0 if ($ords_original[$i] != $ords[$i]);
# }
# 
# ok($okey, "[Scalar] L property test");
# ok($okey2, "[Scalar] Input consistancy test");
# 
# 
# ##### Array Test #####
# $LOG && (open TEST, ">test_array.log");
# 
# my @a2 = ucs_L(@ords);
# $LOG && (print TEST join ' ', @a2);
# $okey  = 1;
# $okey2 = 1;
# for my $i (0..$#ords_original) {
#     $okey  = 0 if ( $a2[$i] != ( (chr($ords_original[$i])=~/\p{L}/) ? 1 : 0) );
#     $okey2 = 0 if ( $ords_original[$i] != $ords[$i] );
# }
# ok($okey,  "[Array] L property test");
# ok($okey2, "[Array] Input consistancy test");
# 
# 
# my @a3 = chr(@ords);
# /\p{L}/ for (@a3);
# 
# my @myChars = q( a b c d e f g 1 2 3 );
# my @property_list2 = ucs_L( ord(@myChars) );
# 
# $LOG && (open TEST, ">test_legal.log");
# $okey = 1;
# for ((0xd800..0xdFFF),(0xFDD0..0xFDEF),(0x40000..0xE0000),(0x10FFFE..0x10FFFF),(0x110000..0x11FFFF),(0x220000..0x220005)) {
#     my $ret = ucs_Legal($_);
#     if ($ret != 0) {
#         $okey = 0;
#         $LOG && print TEST sprintf("(%x,%d)\t", $_, $ret);
#     };
# }
# $LOG && close TEST;
# 
# 
# ##### EastAsianWidth Test #####
# use Unicode::EastAsianWidth;
# 
# $LOG && (open TEST, ">test_east_asian_width.log");
# $okey = 1;
# local $Unicode::EastAsianWidth::EastAsian = 0;
# for my $ord (@ords) {
#     my $ord2 = $ord;
#     next if (!ucs_Legal($ord2));
#     $_ = chr($ord);
#     my $val = ( /\p{InFullwidth}/ ) ? 1 : 0;
#     my $val2 = ucs_EaFullwidth0($ord) ;
#     $LOG && (print TEST "#$ord:($val,$val2)\n");
#     # my $val = 1;
#     $okey = 0 if ( $val != $val2 );
#     die if !defined( $ord );
# };
# $LOG && (close TEST);
# 
# $okey2 = 1;
# for my $i (0..$#ords_original) {
#     $okey2 = 0 if ($ords_original[$i] != $ords[$i]);
# }
# 
# ok($okey,  "[EastAsian] InFullWidth property test");
# ok($okey2, "[EastAsian] Input consistancy test");



__END__
