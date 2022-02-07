
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

print "Content-type: text/html\n\n";

if ($act eq "Update Book") {

    print <<EndofHTML;
<html>
 <head>
  <meta content='noindex,nofollow' name='robots'>
  <link rel="stylesheet" type="text/css"
    href="http://undcemcs01.und.edu/~wen.chen.hu/css/2.css" />
  <title>Update Books</title>
 </head>
 <font size='0'><br /></font>

 <body text='#000000' vLink='#3366CC' link='#3366CC' bgColor='#ffffff' alink='#3366CC' background='https://image.freepik.com/free-photo/open-book-with-glasses-wooden-table-against-background-set-books-vintage-toning_101969-514.jpg'>

 <table width='100%' height='100%'>
  <tr>
   <td align='center' valign='middle'>

<form method="post" action="http://undcemcs02.und.edu/~benu.bansal/cgi-bin/513/1/updatebook.cgi" target="view">
<table width="80%" cellspacing="0" cellpadding="15" border="0" class="shadow">
 <tr bgcolor="#7B7D7D">
    <th align="centre" colspan="3">
    <font face="Verdana, Arial, Helvetica" color="white" size="2"> &nbsp;
UPDATE BOOKS</font>
<div align = "right"><a href = "http://undcemcs02.und.edu/~benu.bansal/513/file/entered.html">Go to Homepage</a></div>
  </th>
 </tr>
 <tr bgcolor="#D0D3D4">
  <td width="75%" valign="middle">
   <font face="Verdana, Arial, Helvetica" size="2">
   <font size="0"><br /></font>

   Select BookTitle:<br>
   <select name="isbn" style="width: 400px;">
   <option style="display:none;"></option>
EndofHTML

$cmd = "/usr/bin/java -Djava.security.egd=file:/dev/./urandom addbook 'menu'";
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
   <input type="submit" name="act" value="Update Speciality"/>
       &nbsp; &nbsp; &nbsp;
   <input type="submit" name="act" value="List Updated Books"/>
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

</table>

  </td>
 </tr>
</table>
</body>
</html>
EndofHTML

}

