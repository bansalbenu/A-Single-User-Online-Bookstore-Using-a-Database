#!/usr/bin/perl
use CGI;
$query     = new CGI;
$act       = $query->param('act');
$password  = $query->param('password');

if ( $act eq "Display source" ) {
    if ( $password eq "bb278" ) {
        print( "Content-type: text/html\n\n" );
	system( "/bin/cat  check.html" );

    }
    else {
	print( "Content-type: text/html\n\n" );
	print( "<center><font size='+2'><b>Wrong password: </b>" );
	print( "<i>$password</i></font>" );
        print( "<form><input type='button' value='Back' onclick='history.go(-1);return false;' /></center>" );
        }
    }
elsif ( $act eq "Help" ) {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat help.html" );
    }
