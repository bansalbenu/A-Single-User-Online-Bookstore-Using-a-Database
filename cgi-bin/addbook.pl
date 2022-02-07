#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');
$isbn = $query -> param('isbn');
$isbn =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$isbn =~ s/^\s*(\S*)\s*$/$1/;
$title = $query -> param('title');
$title =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$title =~ s/^\s*(\S*)\s*$/$1/;
$id  = $query->url_param( "id" );
$speciality = $query -> param('speciality');
$speciality =~ s/;|>|>>|<|\*|\?|\&|\|//g;
$speciality =~ s/^\s*(\S*)\s*$/$1/;


print ( "Content-type: text/html\n\n" );

if ($act eq "Enter Book") {
    system( "/bin/cat  result.html" );

    my @authorid = $query->param( 'id' );
    my @spec = $query->param( 'speciality' );
    $selectid_size = scalar @authorid;
    $spec_size = scalar @spec;

    if($isbn eq "") { print("Please enter 10-digit Book ISBN"); }

    elsif($title eq "") {print("Please enter Book-title");}

    elsif($selectid_size == 0) {
        print("Please select at least one author");}

    elsif($spec_size == 0) {print("Please select at least one specialty");}

    else {
        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom addbook 'book' '";
        $cmd .= $isbn . "' '" . $title . "'";
        system( $cmd );

        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom addbook 'add authors' '";
        $cmd .= $isbn . " ' ";
        foreach my $id (@authorid) {  $cmd .= "'" . $id . "' "; }
        system($cmd);

        $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom addbook 'speciality' '";
        $cmd .= $isbn . " ' ";
        foreach my $speciality (@spec) {  $cmd .= "'" . $speciality . "' "; }
        system($cmd);

    }
}


elsif ($act eq "List Books") {
    system( "/bin/cat  results.html" );

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom addbook 'list'";
    system( $cmd );
}
elsif ( $act eq "Help" ) {
    print ( "Please Contact Manager");
}
system( "/bin/cat  result1.html" );
