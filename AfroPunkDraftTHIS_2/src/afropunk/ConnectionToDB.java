/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package afropunk;

import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author zoebulle
 */
public class ConnectionToDB {
    private Connection connection=null;
    //private static String dbURL="jdbc:mysql://localhost:3306/testdb";
    private static String dbURL="jdbc:mysql://localhost:3306/afrodb";

    public ConnectionToDB() {
        try {
           Class.forName("com.mysql.jdbc.Driver");  
           connection = DriverManager.getConnection(dbURL, "root", "million123");
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }

    public ResultSet queryTable(String sqlStat) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sqlStat);
        return resultSet;
    }

    public void updateTable(String update) throws SQLException {
        Statement statement = connection.createStatement();
        statement.executeUpdate(update);
        statement.close();
    }

    public void changeTable(String sql) {
        try {
            updateTable(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }
    
    public JTable showData(ResultSet rs) throws SQLException{
        ResultSetMetaData rsmd = rs.getMetaData();
        Vector<String> columnNames = new Vector<String>();
        int columnCount = rsmd.getColumnCount();
        for (int column = 1; column <= columnCount; column++) {
            columnNames.add(rsmd.getColumnName(column));
        }

        // data of the table
        Vector<Vector<Object>> data = new Vector<Vector<Object>>();
        while (rs.next()) {
            Vector<Object> vector = new Vector<Object>();
            for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++) {
                vector.add(rs.getObject(columnIndex));
            }
            data.add(vector);
        }
        JTable table = new JTable(new DefaultTableModel(data, columnNames));

        // Closes the Connection

        return(table);
        }
}
    

