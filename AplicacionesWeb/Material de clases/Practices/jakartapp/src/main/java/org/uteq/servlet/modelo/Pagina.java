package org.uteq.servlet.modelo;

public class Pagina {
    private int id;
    private String nombre;
    private String url;
    private boolean publica;
    private int orden;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String v) { this.nombre = v; }
    public String getUrl() { return url; }
    public void setUrl(String v) { this.url = v; }
    public boolean isPublica() { return publica; }
    public void setPublica(boolean v) { this.publica = v; }
    public int getOrden() { return orden; }
    public void setOrden(int v) { this.orden = v; }
}
