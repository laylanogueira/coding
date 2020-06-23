package etec.com.br.database;

import android.os.StrictMode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConfiguration {

    Connection conn = null;

    public DataBaseConfiguration() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
    }

    public Connection conectar() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coding_", "root", "root");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

}
