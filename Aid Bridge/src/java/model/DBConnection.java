package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection("jdbc:derby://localhost:1527/UserDatabase", "app", "app");
    }
}

