#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');
$a_name = $query -> param('a_name');
$a_name =~ s/^\s*(\S*)\s*$/$1/;
$a_name =~ s/;|>|>>|<|\*|\?|\&|\|//g;

if ($act eq "Insert Author") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    if($a_name eq "") {print("Please insert an author name")}

    else {
        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertauthor 'insert' '";
        $cmd .= $a_name . "'";
        system( $cmd );
    }
    system( "/bin/cat  result1.html" );

}
if ($act eq "Delete Author") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    if($a_name eq "") {print("Please insert an author name which you want to delete")}

    else {
        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertauthor 'delete' '";
        $cmd .= $a_name . "'";
        system( $cmd );
    }
    system( "/bin/cat  result1.html" );

}

elsif ($act eq "List Authors") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertauthor 'list'";
    system( $cmd );
    system( "/bin/cat  result1.html" );

}
elsif ($act eq "Homepage") {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  entered.html" );
}

