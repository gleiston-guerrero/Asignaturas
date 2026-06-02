package org.uteq.servlet.modelo;

import java.math.BigDecimal;

public class PedidoDetalle {
    private int id;
    private int idPedido;
    private int idProducto;
    private String productoNombre;
    private int cantidad;
    private BigDecimal precioUnitario = BigDecimal.ZERO;
    private boolean despachado;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getIdPedido() { return idPedido; }
    public void setIdPedido(int v) { this.idPedido = v; }
    public int getIdProducto() { return idProducto; }
    public void setIdProducto(int v) { this.idProducto = v; }
    public String getProductoNombre() { return productoNombre; }
    public void setProductoNombre(String v) { this.productoNombre = v; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int v) { this.cantidad = v; }
    public BigDecimal getPrecioUnitario() { return precioUnitario; }
    public void setPrecioUnitario(BigDecimal v) { this.precioUnitario = v; }
    public boolean isDespachado() { return despachado; }
    public void setDespachado(boolean v) { this.despachado = v; }
    public BigDecimal getSubtotal() {
        return precioUnitario.multiply(BigDecimal.valueOf(cantidad));
    }
}
