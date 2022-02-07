#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');

print "Content-type: text/html\n\n";

if ($act eq "Enter BookStore") {
    system( "cat entered.html" );
}
elsif ( $act eq "Help" ) {
    system( "/bin/cat help.html" );
}
