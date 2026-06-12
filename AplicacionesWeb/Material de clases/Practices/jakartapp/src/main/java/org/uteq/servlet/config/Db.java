package org.uteq.servlet.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Fabrica de conexiones JDBC a PostgreSQL.
 * Para produccion se recomienda un pool (HikariCP) o un DataSource JNDI en Tomcat.
 */
public final class Db {
    static {
        try { Class.forName("org.postgresql.Driver"); }
        catch (ClassNotFoundException e) { throw new ExceptionInInitializerError(e); }
    }
    private Db() {}
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                Config.get("db.url"), Config.get("db.user"), Config.get("db.password"));
    }
}
