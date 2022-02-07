#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');
$speciality = $query -> param('speciality');
$speciality  =~ s/^\s*(\S*)\s*$/$1/;
$speciality  =~ s/;|>|>>|<|\*|\?|\&|\|//g;


if ($act eq "Insert Speciality") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    if($speciality  eq "") {print("Please insert a speciality")}

    else {
        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertspec 'insert' '";
        $cmd .= $speciality . "'";
        system( $cmd );
    }
    system( "/bin/cat  result1.html" );

}

elsif ($act eq "List Specialities") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertspec 'list'";
    system( $cmd );
    system( "/bin/cat  result1.html" );

}
elsif ($act eq "Homepage") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  entered.html" );
}
