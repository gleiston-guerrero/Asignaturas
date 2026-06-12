package org.uteq.servlet.modelo;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Pedido {
    private int id;
    private int idCliente;
    private Integer idDespachador;
    private String estado;
    private boolean liberado;
    private BigDecimal total = BigDecimal.ZERO;
    private LocalDateTime creado;
    private LocalDateTime fechaPago;
    private String clienteNombre;
    private String despachadorNombre;
    private List<PedidoDetalle> detalles = new ArrayList<>();

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdCliente() { return idCliente; }
    public void setIdCliente(int v) { this.idCliente = v; }
    public Integer getIdDespachador() { return idDespachador; }
    public void setIdDespachador(Integer v) { this.idDespachador = v; }
    public String getEstado() { return estado; }
    public void setEstado(String v) { this.estado = v; }
    public boolean isLiberado() { return liberado; }
    public void setLiberado(boolean v) { this.liberado = v; }
    public BigDecimal getTotal() { return total; }
    public void setTotal(BigDecimal v) { this.total = v; }
    public LocalDateTime getCreado() { return creado; }
    public void setCreado(LocalDateTime v) { this.creado = v; }
    public LocalDateTime getFechaPago() { return fechaPago; }
    public void setFechaPago(LocalDateTime v) { this.fechaPago = v; }
    public String getClienteNombre() { return clienteNombre; }
    public void setClienteNombre(String v) { this.clienteNombre = v; }
    public String getDespachadorNombre() { return despachadorNombre; }
    public void setDespachadorNombre(String v) { this.despachadorNombre = v; }
    public List<PedidoDetalle> getDetalles() { return detalles; }
    public void setDetalles(List<PedidoDetalle> v) { this.detalles = v; }

    public int getTotalProductos() {
        int s = 0; for (PedidoDetalle d : detalles) s += d.getCantidad(); return s;
    }
    public int getLineasPendientes() {
        int s = 0; for (PedidoDetalle d : detalles) if (!d.isDespachado()) s++; return s;
    }
    public boolean isVacio() { return detalles.isEmpty(); }
}
