#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');

if ($act eq "Enter BookStore Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat enter.cgi;echo '\n\n\n\n\n';
              cat enter.pl;echo '\n\n\n\n\n';
              cat main.html;");
}
elsif ($act eq "Main BookStore Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat mainpage.cgi;echo '\n\n\n\n\n';
              cat main.pl;echo '\n\n\n\n\n';
              cat entered.html;");
}
elsif ($act eq "Author Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat insertauthor.cgi;echo '\n\n\n\n\n';
              cat insertauthor.pl;echo '\n\n\n\n\n';
              cat insertauthor.java;echo '\n\n\n\n\n'; 
	      cat insertauthor.html");
}
elsif ($act eq "Speciality Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat insertspec.cgi;echo '\n\n\n\n\n';
              cat insertspec.pl;echo '\n\n\n\n\n';
              cat insertspec.java;echo '\n\n\n\n\n';
              cat insertspec.html");
}
elsif ($act eq "Book Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat addbook.cgi;echo '\n\n\n\n\n';
              cat addbook.pl;echo '\n\n\n\n\n';
              cat addbook.java;");
}
elsif ($act eq "Hyperlink") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat hyperlink.cgi;echo '\n\n\n\n\n';
              cat hyperlink.pl;echo '\n\n\n\n\n';
              cat hyperlink.java;");
}
elsif ($act eq "Update Book Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat update.cgi;echo '\n\n\n\n\n';
              cat update.pl;echo '\n\n\n\n\n';
              cat updatebook.cgi;echo '\n\n\n\n\n';
              cat updatebook.pl;echo '\n\n\n\n\n';
              cat updatebook.java;");
}

elsif ($act eq "SourceCode Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat check.cgi;echo '\n\n\n\n\n';
              cat check.pl;echo '\n\n\n\n\n';
              cat check.html;echo '\n\n\n\n\n';
              cat displaycode.cgi;;echo '\n\n\n\n\n';
              cat displaycode.pl;");

}
elsif ($act eq "Reset code") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat reset.cgi;echo '\n\n\n\n\n';
              cat reset.pl;echo '\n\n\n\n\n';
              cat reset.java;echo '\n\n\n\n\n';
              cat reset.html");

}

elsif ($act eq "Help Page") {
    print ( "Content-type: text/plain\n\n" );
     system( "cat help.html");
}
