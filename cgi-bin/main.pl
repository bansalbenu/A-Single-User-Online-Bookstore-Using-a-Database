#!/usr/bin/perl
use CGI;
$query = new CGI;
$act = $query -> param('act');

print "Content-type: text/html\n\n";

if ($act eq "Insert Author") {
    system( "/bin/cat  insertauthor.html" );
}
elsif ($act eq "Insert Speciality") {
    system( "/bin/cat  insertspec.html" );
}

elsif ($act eq "Insert Book") {

print <<EndofHTML;
<html>
 <head>
  <meta content='noindex,nofollow' name='robots'>
  <link rel="stylesheet" type="text/css"
    href="http://undcemcs01.und.edu/~wen.chen.hu/css/2.css" />
  <title>Insert Books</title>
 </head>
 <font size='0'><br /></font>

 <body text='#000000' vLink='#3366CC' link='#3366CC' bgColor='#ffffff' alink='#3366CC' background='https://image.freepik.com/free-photo/open-book-with-glasses-wooden-table-against-background-set-books-vintage-toning_101969-514.jpg'>

 <table width='100%' height='100%'>
  <tr>
   <td align='center' valign='middle'>

<form method="post" action="http://undcemcs02.und.edu/~benu.bansal/cgi-bin/513/1/addbook.cgi" target="view">
<table width="80%" cellspacing="0" cellpadding="15" border="0" class="shadow">
 <tr bgcolor="#7B7D7D">
    <th align="centre" colspan="3">
    <font face="Verdana, Arial, Helvetica" color="white" size="2"> &nbsp;
INSERT BOOKS</font>
<div align = "right"><a href = "http://undcemcs02.und.edu/benu.bansal/513/file/entered.html">Go to Homepage</a></div>
  </th>
 </tr>
 <tr bgcolor="#D0D3D4">
  <td width="75%" valign="middle">
   <font face="Verdana, Arial, Helvetica" size="2">
   <font size="0"><br /></font>

   &nbsp; ISBN:
   <input type="text" name="isbn" size="10" maxlength="10" placeholder="Enter ISBN no.">
   <br /><font size="0"><br /></font>
   &nbsp; Book Title:
   <input type="text" name="title" size="64" placeholder ="Enter Book title">
   <br /><font size="0"><br /></font>
   Select author:<br>
   <select name="id" multiple size="4"  style="width: 200px;">
EndofHTML

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertauthor 'menu'";
    print($cmd);
    system($cmd);
print <<EndofHTML;
   </select><br /><font size="0"><br /></font>
   Select specialties:<br>
   <select name="speciality" multiple size="5" style="width: 200px;">
EndofHTML

    $cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom insertspec 'menu'";
    print($cmd);
    system($cmd);

print <<EndofHTML;
   </select> </font>
   <p align="center">
   <input type="submit" name="act" value="Enter Book"/>
   &nbsp; &nbsp; &nbsp;
   <input type="submit" name="act" value="List Books"/>
   &nbsp; &nbsp; &nbsp;
   <input type="submit" name="act" value="Help"/>
   &nbsp; &nbsp; &nbsp;
   <input type="reset"             value="Reset"/>
   <font size="0"><br /></font><font size="0"><br /></font>
   <b>&#8230;</b>
   </center></font>
   </td>
  </tr>
  <tr bgcolor="#EDF3FE">
   <td>
    <iframe frameborder="0" width="100%" height="200" img src="https://venngage-wordpress.s3.amazonaws.com/uploads/2018/09/Minimalist-Crumpled-Paper-Simple-Background-Image.jpg" name="view">
    </iframe>
</form>
 <form method="post" action="http://undcemcs02.und.edu/~benu.bansal/cgi-bin/513/1/update.cgi">
 <tr bgcolor="#B2BABB">
  <td colspan="3">
   <font face="Verdana, Arial, Helvetica" SIZE="1">
   
   <input type="submit" name="act" value="Update Book"/> &nbsp; &nbsp;
   
   </font>
  </td>
 </tr>
 </form>
</table>

  </td>
 </tr>
</table>
</body>
</html>
EndofHTML
}
elsif ( $act eq "System Reset" ) {
    system( "/bin/cat  reset.html" );
    
}
elsif ( $act eq "Exit BookStore" ) {
    print ( "Content-type: text/html\n\n" );
    system( "cat ../../../513/1/main.html");
}
elsif ( $act eq "Help" ) {
    print ( "Content-type: text/html\n\n" );
    system( "/bin/cat help.html" );
}

