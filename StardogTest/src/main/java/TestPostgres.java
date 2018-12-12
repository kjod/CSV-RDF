
import com.complexible.stardog.api.Connection;
import com.complexible.stardog.api.ConnectionConfiguration;
import com.complexible.stardog.api.ConnectionPool;
import com.complexible.stardog.api.ConnectionPoolConfig;
import com.complexible.stardog.api.admin.AdminConnection;
import com.complexible.stardog.api.admin.AdminConnectionConfiguration;
import com.complexible.stardog.virtual.api.admin.VirtualGraphAdminConnection;

import java.sql.DriverManager;
import java.util.concurrent.TimeUnit;

//import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestPostgres {
    /**
     *  Creates a connection to the DBMS itself so we
     *  can perform some administrative actions.
     */
    private static String url = "http://localhost:5820";
    private static String username = "admin";
    private static String password = "admin";
    private static String to = "WineTest";
    private static boolean reasoningType = false;
    private static int maxPool = 200;
    private static int minPool = 10;

    private static long blockCapacityTime = 900;
    private static TimeUnit blockCapacityTimeUnit = TimeUnit.SECONDS;
    private static long expirationTime = 300;
    private static TimeUnit expirationTimeUnit = TimeUnit.SECONDS;

    public java.sql.Connection connectToPostgres() {

        try {
            //Register Postgres
            Class.forName("com.ddtek.jdbc.postgresql.PostgreSQLdriver");
        } catch (Exception e){
            System.out.println(e);
        }

        java.sql.Connection dbConnection = null;
        try (java.sql.Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/incognito", "postgres", "postgres")) {

            // When this class first attempts to establish a connection, it automatically loads any JDBC 4.0 drivers found within
            // the class path. Note that your application must manually load any JDBC drivers prior to version 4.0.
//			Class.forName("org.postgresql.Driver");

            System.out.println("Connected to PostgreSQL database!");
            Statement statement = connection.createStatement();
            System.out.println("Reading incognito records...");
            System.out.printf("%-30.30s  %-30.30s%n", "Name", "Colour");
            ResultSet resultSet = statement.executeQuery("SELECT * FROM grape");
            while (resultSet.next()) {
                System.out.printf("%-30.30s  %-30.30s%n", resultSet.getString("name"), resultSet.getString("colour"));
            }
            dbConnection = connection;
        } /*catch (ClassNotFoundException e) {
			System.out.println("PostgreSQL JDBC driver not found.");
			e.printStackTrace();
		}*/ catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }

        return dbConnection;
    }


    public static void createAdminConnection() {


        try (final AdminConnection aConn = AdminConnectionConfiguration.toServer(url)
                .credentials(username, password)
                .connect()) {

            // A look at what databases are currently in Stardog
            aConn.list().forEach(item -> System.out.println(item));

            // Checks to see if the 'myNewDB' is in Stardog. If it is, we are
            // going to drop it so we are starting fresh
            if (aConn.list().contains(to)) {aConn.drop(to);}
            // Convenience function for creating a persistent
            // database with all the default settings.
            aConn.disk(to).create();
        }
    }

    /**
     * Now we want to create the configuration for our pool.
     * @param connectionConfig the configuration for the connection pool
     * @return the newly created pool which we will use to get our Connections
     */
    private static ConnectionPool createConnectionPool
    (ConnectionConfiguration connectionConfig) {
        ConnectionPoolConfig poolConfig = ConnectionPoolConfig
                .using(connectionConfig)
                .minPool(minPool)
                .maxPool(maxPool)
                .expiration(expirationTime, expirationTimeUnit)
                .blockAtCapacity(blockCapacityTime, blockCapacityTimeUnit);

        return poolConfig.create();
    }

    public static void main(String [] args){
        System.out.println("Lets try it");
        TestPostgres t = new TestPostgres();

        java.sql.Connection dbConnection = t.connectToPostgres();

        t.createAdminConnection();

        ConnectionConfiguration connectionConfig = ConnectionConfiguration
                .to(to)
                .server(url)
                .reasoning(reasoningType)
                .credentials(username, password);
        // creates the Stardog connection pool
        ConnectionPool connectionPool = t.createConnectionPool(connectionConfig);

        //VirtualGraphAdminConnection

    }
}
