import  java.sql.*;
import  java.io.*;
import  oracle.jdbc.*;
import  oracle.jdbc.pool.OracleDataSource;

class insertspec {
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
                String  query  = "insert into spec (speciality) values ('" + args[1].trim() + "')";
                ResultSet rset = stmt.executeQuery( query );
                System.out.println( "<b>The speciality " + args[1].trim() + " added successfully.</b>" );

                rset.close( );
                stmt.close( );
            }
            catch ( SQLException ex ) {System.out.println( ex ); }
        }

        if(args[0].equals("list")){
            try {
                String  query  = "select * from spec order by speciality, spec_id";
                ResultSet rset = stmt.executeQuery( query );

                while ( rset.next( ) ) {
                    System.out.print( "<a href ='http://undcemcs02.und.edu/~benu.bansal/cgi-bin/513/1/hyperlink.cgi?list=speciality&id=" + rset.getString(1) + "'>" + rset.getString(2) + " (SpecialityID- " + rset.getString(1) + ")</a><br>");
                }
                rset.close( );
                stmt.close( );
            }
            catch ( SQLException ex ) { System.out.println( ex );  }
        }

        if(args[0].equals("menu")){
            try {
                String  query  = "select * from spec order by speciality, spec_id";
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
