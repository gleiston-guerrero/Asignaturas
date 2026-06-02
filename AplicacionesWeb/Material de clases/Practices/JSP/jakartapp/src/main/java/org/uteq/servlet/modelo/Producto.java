package org.uteq.servlet.modelo;

import java.math.BigDecimal;

public class Producto {
    private int id;
    private String nombre;
    private String descripcion;
    private int existencias;
    private int existenciasMinimas;
    private int reservado;
    private int disponible;
    private BigDecimal precioActual = BigDecimal.ZERO;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String v) { this.nombre = v; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String v) { this.descripcion = v; }
    public int getExistencias() { return existencias; }
    public void setExistencias(int v) { this.existencias = v; }
    public int getExistenciasMinimas() { return existenciasMinimas; }
    public void setExistenciasMinimas(int v) { this.existenciasMinimas = v; }
    public int getReservado() { return reservado; }
    public void setReservado(int v) { this.reservado = v; }
    public int getDisponible() { return disponible; }
    public void setDisponible(int v) { this.disponible = v; }
    public BigDecimal getPrecioActual() { return precioActual; }
    public void setPrecioActual(BigDecimal v) { this.precioActual = v; }
}
