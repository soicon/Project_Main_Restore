
package com.dal;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBContext {
    private Connection connection;

    public Connection getConnection() {
        return connection;
    }
    //open db connection
    public DBContext(String name) throws Exception{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName="+name;
        connection = DriverManager.getConnection(url, "sa", "123456");
    }
    
    public void close() throws Exception {
        if(connection != null) connection.close();
    }
}
