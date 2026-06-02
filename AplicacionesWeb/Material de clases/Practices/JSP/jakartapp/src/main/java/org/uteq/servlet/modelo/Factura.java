package org.uteq.servlet.modelo;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Factura {
    private int id;
    private int idPedido;
    private String numero;
    private LocalDateTime fecha;
    private BigDecimal subtotal = BigDecimal.ZERO;
    private BigDecimal iva = BigDecimal.ZERO;
    private BigDecimal total = BigDecimal.ZERO;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdPedido() { return idPedido; }
    public void setIdPedido(int v) { this.idPedido = v; }
    public String getNumero() { return numero; }
    public void setNumero(String v) { this.numero = v; }
    public LocalDateTime getFecha() { return fecha; }
    public void setFecha(LocalDateTime v) { this.fecha = v; }
    public BigDecimal getSubtotal() { return subtotal; }
    public void setSubtotal(BigDecimal v) { this.subtotal = v; }
    public BigDecimal getIva() { return iva; }
    public void setIva(BigDecimal v) { this.iva = v; }
    public BigDecimal getTotal() { return total; }
    public void setTotal(BigDecimal v) { this.total = v; }
}
