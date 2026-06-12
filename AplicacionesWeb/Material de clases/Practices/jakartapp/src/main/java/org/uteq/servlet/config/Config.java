package org.uteq.servlet.config;

import java.io.InputStream;
import java.util.Properties;

/** Carga aplicacion.properties desde el classpath una sola vez. */
public final class Config {
    private static final Properties PROPS = new Properties();
    static {
        try (InputStream in = Config.class.getClassLoader()
                .getResourceAsStream("aplicacion.properties")) {
            if (in == null) throw new IllegalStateException("No se encontro aplicacion.properties");
            PROPS.load(in);
        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    private Config() {}
    public static String get(String clave) { return PROPS.getProperty(clave); }
    public static String get(String clave, String porDefecto) { return PROPS.getProperty(clave, porDefecto); }
    public static boolean getBool(String clave) { return Boolean.parseBoolean(PROPS.getProperty(clave, "false")); }
    public static double getDouble(String clave, double porDefecto) {
        try { return Double.parseDouble(PROPS.getProperty(clave)); } catch (Exception e) { return porDefecto; }
    }
}
