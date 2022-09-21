
package afropunk;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StorageManager {
     private Connection connector;
     
     public StorageManager(String URL) throws ClassNotFoundException, SQLException {
        String driver = "net.ucanaccess.jdbc.UcanaccessDriver";
        Class.forName(driver);
        connector = DriverManager.getConnection("jdbc:ucanaccess://"+URL);
     }// connects to database

    public Connection getConnector() {
        return this.connector;
    }// getter for connector
    
    public ResultSet exQuery(String SQL)throws SQLException{
        Statement stmt = this.connector.createStatement();
        ResultSet result = stmt.executeQuery(SQL);
        return result;       
    } // executes Select statements 
     
    public int update(String SQL) throws  SQLException{ 
        Statement stmt = connector .createStatement();
        int done = stmt.executeUpdate(SQL);
        return done;
    }// Update, delete, insert
    
    public int updateReturnID(String SQL) throws SQLException{
        Statement stmt = connector .createStatement();
        int id =-1;
        stmt.executeUpdate(SQL,Statement.RETURN_GENERATED_KEYS);
        ResultSet result = stmt.getGeneratedKeys();
        if(result.next()){
            id = result.getInt(1);
        }
        return id;
        
    } // second case 
}
