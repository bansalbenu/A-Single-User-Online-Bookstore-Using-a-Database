#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');
$id  = $query->url_param( "id" );
$list  = $query->url_param( "list" );
$speciality = $query -> param("speciality");
$speciality =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$speciality =~ s/^\s*(\S*)\s*$/$1/;


print ( "Content-type: text/html\n\n" );

if ($list eq "author") {
    system( "/bin/cat  result.html" );
    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom hyperlink 'author' '";
    $cmd .= $id . "'";
    system( $cmd );
    system( "/bin/cat  result1.html" );

}
if ($list eq "speciality") {
    system( "/bin/cat  result.html" );
    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom hyperlink 'speciality' '";
    $cmd .= $id . "'";
    system( $cmd );
    system( "/bin/cat  result1.html" );

}
if ($list eq "book") {
    system( "/bin/cat  result.html" );
    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom hyperlink 'book' '";
    $cmd .= $id . "'";
    system( $cmd );
    system( "/bin/cat  result1.html" );

}
