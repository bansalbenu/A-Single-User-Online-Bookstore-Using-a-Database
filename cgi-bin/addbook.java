import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  addbook {
    public static void  main( String args[ ] ) throws SQLException {
	String user     = "C##benu.bansal";
	String password = "benu2056";
	String database = "65.52.222.73:1521/cdb1";

	OracleDataSource ods = new OracleDataSource( );
	ods.setURL     ( "jdbc:oracle:thin:@" + database );
	ods.setUser    ( user );
	ods.setPassword( password );
	Connection conn = ods.getConnection( );

	if (args[0].equals("add authors")) {
	    try{
		for ( int i=2;  i < args.length;  i++ ){
		    Statement stmt = conn.createStatement( );
		    String query = "insert into book_author(isbn, author_id) values ('" + args[1].trim() + "', '" + args[i].trim() + "')";
		    ResultSet rset = stmt.executeQuery(query);
		    rset.close();
		    stmt.close();
		}}


	    catch ( SQLException ex ) { System.out.println( ex );   }

	}

	if (args[0].equals("book")) {
	    try {
		Statement stmt = conn.createStatement( );
		String  query  = "insert into book (isbn, title) values ('" + args[1].trim() + "', '" + args[2].trim() + "')";
		ResultSet rset = stmt.executeQuery( query );

		rset.close( );
		stmt.close( );

		System.out.println( "<b>The book " + args[2].trim() + " is added successfully.</b>" );

	    }
	    catch ( SQLException ex ) {
		System.out.println( ex );
	    }
	}

	if (args[0].equals("speciality")) {
	    try{
		for ( int i=2;  i < args.length;  i++ ){
		    Statement stmt = conn.createStatement( );
		    String query = "select speciality from spec where spec_id = '" + args[i].trim() + "'";
		    ResultSet rset = stmt.executeQuery(query);

		    Statement stmt2 = conn.createStatement( );
		    while ( rset.next( ) ) {
			String query2 = "insert into book_spec (isbn, speciality) values ('" + args[1].trim() + "', '" + rset.getString(1) + "')";
			ResultSet rset2 = stmt2.executeQuery(query2);
			rset2.close();
		    }

		    rset.close();
		    stmt.close();
		    stmt2.close();
		}}


	    catch ( SQLException ex ) { System.out.println( ex );   }

	}


	if(args[0].equals("list")){
	    try {
		Statement stmt = conn.createStatement( );
		String  query  = "select * from book order by title, isbn";
		ResultSet rset = stmt.executeQuery( query );

		while ( rset.next( ) ) {
		    System.out.print( "<a href ='http://undcemcs02.und.edu/~benu.bansal/cgi-bin/513/1/hyperlink.cgi?list=book&id=" + rset.getString(1) + "'>" + rset.getString(1) + " (Book Title: " + rset.getString(2) + ")</a><br>");
		}
		rset.close( );
		stmt.close( );
	    }
	    catch ( SQLException ex ) { System.out.println( ex );  }
	}


	if(args[0].equals("menu")){
            try {
		Statement stmt = conn.createStatement( );
                String  query  = "select * from book order by title, isbn";
                ResultSet rset = stmt.executeQuery( query );

                while ( rset.next( ) ) {
                    System.out.print( "<option value ='" + rset.getString(1) + "'>" + rset.getString(2) + " (ISBN: " + rset.getString(1) + ")");
                }

                rset.close( );
                stmt.close( );
            }
            catch ( SQLException ex ) { System.out.println( ex );  }
        }
	conn.close( );
    }}
