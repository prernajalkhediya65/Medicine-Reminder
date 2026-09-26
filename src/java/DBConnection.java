import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/medicine_db",
                "root",
                ""
            );

            System.out.println("DATABASE CONNECTED");

            return con;

        } catch (Exception e) {

            System.out.println("DATABASE CONNECTION ERROR:");
            e.printStackTrace();

            return null;
        }
    }
}