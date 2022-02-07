#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');


if ($act eq "Clear System") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom reset ";
    system( $cmd );    
}
system( "/bin/cat  result1.html" );
