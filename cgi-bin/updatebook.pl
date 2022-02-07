#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');
$isbn = $query -> param('isbn');
$isbn =~ s/^\s*(\S*)\s*$/$1/;
$isbn =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$speciality = $query -> param('specilaity');
$speciality =~ s/^\s*(\S*)\s*$/$1/;
$speciality =~ s/;|>|>>|<|\*|\?|\&|\|//g;

if ($act eq "Update Speciality") {
   
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    my @spec = $query->param( 'speciality' );
    $spec_size = scalar @spec;

    if($isbn eq "") {print("Please select Book-title");}

    elsif($spec_size == 0) {print("Please select at least one specialty");}

    else {
	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom updatebook 'upgrade' '";
        $cmd .= $isbn . " ' ";
	foreach my $speciality (@spec) {  $cmd .= "'" . $speciality . "' "; }
        system( $cmd );
	
	$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom updatebook 'Insert' '";
        $cmd .= $isbn . " ' ";
        foreach my $speciality (@spec) {  $cmd .= "'" . $speciality . "' "; }
        system( $cmd );

    }
    system( "/bin/cat  result1.html" );

}

elsif ($act eq "List Updated Books") {
    print ( "Content-type: text/html\n\n" );

    system( "/bin/cat  results.html" );

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom addbook 'list'";
    system( $cmd );
    system( "/bin/cat  result1.html" );

}

elsif ( $act eq "Help" ) {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat  result.html" );

    print ( "Please Contact Manager");
    system( "/bin/cat  result1.html" );

}

