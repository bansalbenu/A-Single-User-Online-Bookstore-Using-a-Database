import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class hyperlink {
    public static void  main( String args[ ] ) throws SQLException {
	String user     = "C##benu.bansal";
	String password = "benu2056";
	String database = "65.52.222.73:1521/cdb1";

	OracleDataSource ods = new OracleDataSource( );
	ods.setURL     ( "jdbc:oracle:thin:@" + database );
	ods.setUser    ( user );
	ods.setPassword( password );
	Connection conn = ods.getConnection( );

	Statement stmt = conn.createStatement( );

	if(args[0].equals("author")){
	    try {
		String  query  = "select * from author where author_id = " + args[1].trim() + " order by author_name, author_id";
		ResultSet rset = stmt.executeQuery( query );

		while ( rset.next( ) ) {
		    System.out.println("<b><u>Author ID:</u> </b>" + rset.getString(1) + "<br>");
		    System.out.println("<b><u>Author Name:</u> </b>" + rset.getString(2) + "<br>");
		}
		rset.close( );
		stmt.close( );

		System.out.println("<b><u>Specialities:</u> </b><br>");

                Statement stmt2 = conn.createStatement( );
                String query2 = "select distinct c.speciality from book_author z, book_spec c where z.author_id = " + args[1].trim() ;
                query2 += " and z.isbn = c.isbn order by c.speciality";
                ResultSet rset2 = stmt2.executeQuery( query2 );

                while ( rset2.next( ) ) {
                    System.out.println(rset2.getString(1) + "<br>");
                }
                rset2.close( );
                stmt2.close( );
		
		System.out.println("<u><b>Book Title:</u> </b><br>");

		Statement stmt3 = conn.createStatement( );
		String query3 = "select b.isbn, title from book_author z, book b where z.author_id = " + args[1].trim() ;
		query3 += " and z.isbn = b.isbn order by title, isbn";
		ResultSet rset3 = stmt3.executeQuery( query3 );

		while ( rset3.next( ) ) {
		    System.out.println(rset3.getString(2) + "<br>");
		}
		rset3.close( );
		stmt3.close( );
	    }

	    catch ( SQLException ex ) { System.out.println( ex ); }
	}

	if(args[0].equals("speciality")){
	    try {
		String  query  = "select speciality from spec where spec_id = " + args[1].trim();
		ResultSet rset = stmt.executeQuery( query );

		while ( rset.next( ) ) {
		    System.out.println("<b><u>Speciality: </b></u>" + rset.getString(1) + "<br>");
		}
		rset.close( );
		stmt.close( );
		System.out.println("<b><u>Book Title:</u> </b></br>");
		Statement stmt2 = conn.createStatement( );
		String query2 = "select b.isbn, title from book_spec c, spec s, book b where spec_id = " + args[1].trim();
		query2 += " and s.speciality = c.speciality and c.isbn = b.isbn order by title, b.isbn";
		ResultSet rset2 = stmt2.executeQuery( query2 );

		while ( rset2.next( ) ) {
		    System.out.println(rset2.getString(2) + "<br>");
		}
		rset2.close( );
		stmt2.close( );
		System.out.println("<b><u>Author Names:</u> </b></br>");
		Statement stmt3 = conn.createStatement( );
		String query3 = "select distinct a.author_id, author_name from author a, book_author z, book_spec c, spec s where spec_id = " + args[1].trim();
		query3 += " and s.speciality = c.speciality and c.isbn = z.isbn and z.author_id = a.author_id order by author_name, a.author_id";
		ResultSet rset3 = stmt3.executeQuery( query3 );

		while ( rset3.next( ) ) {
		    int count = 1;
		    System.out.println(rset3.getString(2) + "<br>");
		    
		}

		rset3.close( );
		stmt3.close( );
	    }

	    catch ( SQLException ex ) { System.out.println( ex ); }
	}

	if(args[0].equals("book")){
	    try {
		String  query  = "select distinct * from book where isbn = " + args[1].trim() + " order by title, isbn";
		ResultSet rset = stmt.executeQuery( query );

		while ( rset.next( ) ) {
		    System.out.println("<b><u>ISBN:</u> </b>" + rset.getString(1) + "<br>");
		    System.out.println("<b><u>Book Title:</u> </b>" + rset.getString(2) + "<br>");
		    
		}
		rset.close( );
		stmt.close( );
		System.out.println("<b><u>Author Names:</u></b><br>");

		Statement stmt2 = conn.createStatement( );
		String query2 = "select a.author_id, author_name from book_author z, author a where z.isbn = " + args[1].trim();
		query2 += " and z.author_id = a.author_id order by author_name, author_id";
		ResultSet rset2 = stmt2.executeQuery( query2 );

		while ( rset2.next( ) ) {
		    System.out.println(rset2.getString(2) + "<br>");
		}
		rset2.close( );
		stmt2.close( );
		
		System.out.println("<u><b>Specialities:</u> </b><br>");

		Statement stmt3 = conn.createStatement( );
		String query3 = "select distinct isbn, speciality from book_spec where isbn = " + args[1].trim() + " order by speciality";
		ResultSet rset3 = stmt3.executeQuery( query3 );

		while ( rset3.next( ) ) {
		    System.out.println(rset3.getString(2) + "<br>");
		}
		rset3.close( );
		stmt3.close( );
	    }

	    catch ( SQLException ex ) { System.out.println( ex ); }
	}
	conn.close( );
    }
}
