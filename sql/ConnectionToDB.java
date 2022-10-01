
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author nsika
 */
public class ConnectionToDB {

    private Connection connection = null;// Creates a connection to the database.

    private Statement statement = null; // Creates a statement to execute SQL.
    public static String dbURL = "";

    public ConnectionToDB() {
        // Creating connection to database.
        try {
            connection = DriverManager.getConnection(dbURL); // This code connects the project to the database
        } catch (SQLException e) {
            System.out.println(e);
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
}
