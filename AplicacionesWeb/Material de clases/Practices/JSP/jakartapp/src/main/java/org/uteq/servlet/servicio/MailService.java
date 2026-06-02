package org.uteq.servlet.servicio;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.uteq.servlet.config.Config;
import org.uteq.servlet.dao.ProductoDao.AvisoStock;

import java.util.Properties;
import java.util.logging.Logger;

/** Envia el aviso al proveedor cuando un producto cae por debajo del minimo. */
public class MailService {
    private static final Logger LOG = Logger.getLogger(MailService.class.getName());

    public void avisarBajoStock(AvisoStock a) {
        String asunto = "Reabastecimiento requerido: " + a.producto;
        String cuerpo = "Estimado proveedor " + a.proveedor + ":\n\n" +
                "El producto \"" + a.producto + "\" alcanzo un nivel critico de inventario.\n" +
                "Existencias actuales: " + a.existencias + "\n" +
                "Existencias minimas:  " + a.minimo + "\n\n" +
                "Solicitamos coordinar el reabastecimiento.\n\nTiendaUTEQ";
        enviar(a.proveedorEmail, asunto, cuerpo);
    }

    private void enviar(String para, String asunto, String cuerpo) {
        if (!Config.getBool("mail.enabled")) {
            LOG.warning("[CORREO SIMULADO] Para: " + para + " | Asunto: " + asunto + "\n" + cuerpo);
            return;
        }
        try {
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.host", Config.get("mail.smtp.host"));
            p.put("mail.smtp.port", Config.get("mail.smtp.port"));
            Session s = Session.getInstance(p, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(
                            Config.get("mail.smtp.user"), Config.get("mail.smtp.password"));
                }
            });
            MimeMessage m = new MimeMessage(s);
            m.setFrom(new InternetAddress(Config.get("mail.from")));
            m.addRecipient(Message.RecipientType.TO, new InternetAddress(para));
            m.setSubject(asunto, "UTF-8");
            m.setText(cuerpo, "UTF-8");
            Transport.send(m);
            LOG.info("Correo enviado al proveedor: " + para);
        } catch (Exception e) {
            LOG.severe("No se pudo enviar el correo: " + e.getMessage());
        }
    }
}
