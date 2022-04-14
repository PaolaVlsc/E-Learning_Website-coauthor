package projectel.projectel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    static Connection getConnection() {
        final String dbDriver = "org.mariadb.jdbc.Driver";
        final String dbURL = "jdbc:mariadb://localhost:3306/";
        final String dbName = "projectELDb";
        final String dbUsername = "root";
        final String dbPassword = "";

        Connection conn;

        try {
            // Load class driver in the runtime
            Class.forName(dbDriver);
            System.out.println("Loaded driver");

            // Start connection to DB
            conn = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
            System.out.println("Connected to MariaDb Database");

            if (conn != null) {
                return conn;
            }

        } catch (ClassNotFoundException ex) {
            System.out.println("Driver class exception: " + ex);
        } catch (SQLException ex) {
            System.out.println("DB Connection exception: " + ex);
        }
        return null; // Connection failed
    }
}
