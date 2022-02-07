import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  reset {
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
	String cmd;

	try {

	    cmd = "delete from book_author";
	    stmt.execute(cmd);

	    cmd = "delete from book_spec";
	    stmt.execute(cmd);

	    cmd = "delete from book";
	    stmt.execute(cmd);

	    cmd = "delete from author";
	    stmt.execute(cmd);

	    cmd = "delete from spec";
	    stmt.execute(cmd);

	    System.out.println( "The database has been reset." );

	    stmt.close( );
	}
	catch ( SQLException ex ) {
	    System.out.println( ex );
	}
	
	conn.close( );
    }}
