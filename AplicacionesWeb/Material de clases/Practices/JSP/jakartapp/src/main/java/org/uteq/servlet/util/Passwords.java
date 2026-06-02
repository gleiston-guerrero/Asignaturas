package org.uteq.servlet.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * Hash de contrasenas. Demo academica: SHA-256 hex (sin sal).
 * En produccion use bcrypt/Argon2 con sal por usuario.
 */
public final class Passwords {
    private Passwords() {}
    public static String hash(String plano) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] d = md.digest(plano.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(d.length * 2);
            for (byte b : d) sb.append(String.format("%02x", b));
            return sb.toString();
        } catch (Exception e) { throw new RuntimeException(e); }
    }
    public static boolean verificar(String plano, String hashGuardado) {
        return hash(plano).equalsIgnoreCase(hashGuardado);
    }
}
