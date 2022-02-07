import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class  updatebook {
    public static void  main( String args[ ] ) throws SQLException {
        String user     = "C##benu.bansal";
        String password = "benu2056";
        String database = "65.52.222.73:1521/cdb1";

        OracleDataSource ods = new OracleDataSource( );
        ods.setURL     ( "jdbc:oracle:thin:@" + database );
        ods.setUser    ( user );
        ods.setPassword( password );
        Connection conn = ods.getConnection( );

        if (args[0].equals("upgrade")) {
            try {
                
                for ( int i=2;  i < args.length;  i++ ){
                    Statement stmt = conn.createStatement( );
                    String query =  "select speciality from spec where spec_id = '" + args[i].trim() + "'";

                    ResultSet rset = stmt.executeQuery(query);
		
                    Statement stmt2 = conn.createStatement( );
                    while(rset.next()) {
                        
                        String query2 = "UPDATE book_spec SET speciality = null WHERE isbn= '" +args[1].trim()+"'";
                        ResultSet rset2 = stmt2.executeQuery(query2);
                        rset2.close();

                    }
                    rset.close( );
                    stmt.close( );
                    stmt2.close();
	        
	    }}
	    catch ( SQLException ex ) {
		System.out.println( ex );
	    }}

	if (args[0].equals("Insert")) {
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
		   
                }
		System.out.println( "<b>The speciality for (ISBN-'" + args[1].trim() + "' ) was updated successfully.</b><br>" );
}


            catch ( SQLException ex ) { System.out.println( ex );   }

        }


	conn.close( );
    }}
