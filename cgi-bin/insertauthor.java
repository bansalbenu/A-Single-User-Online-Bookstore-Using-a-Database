import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class insertauthor {
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

	if(args[0].equals("insert")) {
	    try {
		String  query  = "insert into author (author_name) values ('" + args[1].trim() + "')";
		ResultSet rset = stmt.executeQuery( query );
		System.out.println( "<b>The author " + args[1].trim() + " added successfully.</b>" );

		rset.close( );
		stmt.close( );
	    }
	    catch ( SQLException ex ) {System.out.println( ex ); }
	}
	
	if(args[0].equals("delete")) {
            try {
		String  query  = "delete from author where author_name ='" + args[1].trim() + "'";
                ResultSet rset = stmt.executeQuery( query );
                System.out.println( "<b>The author " + args[1].trim() + " deleted successfully.</b>" );

                rset.close( );
                stmt.close( );
            }
            catch ( SQLException ex ) {System.out.println( ex ); }
        }

	if(args[0].equals("list")){
	    try {
		String  query  = "select * from author order by author_name, author_id";
		ResultSet rset = stmt.executeQuery( query );

		while ( rset.next( ) ) {
		    System.out.print( "<a href ='http://undcemcs02.und.edu/~benu.bansal/cgi-bin/513/1/hyperlink.cgi?list=author&id=" + rset.getString(1) + "'>" + rset.getString(2) + "  (ID- " + rset.getString(1) + ")</a><br>");
		}
		rset.close( );
		stmt.close( );
	    }
	    catch ( SQLException ex ) { System.out.println( ex );  }
	}

	if(args[0].equals("menu")){
	    try {
		String  query  = "select * from author order by author_name, author_id";
		ResultSet rset = stmt.executeQuery( query );

		while ( rset.next( ) ) {
		    System.out.print( "<option value ='" + rset.getString(1) + "'>" + rset.getString(2) + " (ID: " + rset.getString(1) + ")");
		}

		rset.close( );
		stmt.close( );
	    }
	    catch ( SQLException ex ) { System.out.println( ex );  }
	}

	conn.close( );
    }}
