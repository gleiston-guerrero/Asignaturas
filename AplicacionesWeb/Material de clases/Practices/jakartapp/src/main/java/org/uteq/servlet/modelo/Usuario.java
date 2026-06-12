package org.uteq.servlet.modelo;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
    private int id;
    private String username;
    private String nombre;
    private String email;
    private List<String> roles = new ArrayList<>();
    private Integer idCliente;   // si es CLIENTE

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String v) { this.username = v; }
    public String getNombre() { return nombre; }
    public void setNombre(String v) { this.nombre = v; }
    public String getEmail() { return email; }
    public void setEmail(String v) { this.email = v; }
    public List<String> getRoles() { return roles; }
    public void setRoles(List<String> v) { this.roles = v; }
    public Integer getIdCliente() { return idCliente; }
    public void setIdCliente(Integer v) { this.idCliente = v; }
    public boolean tieneRol(String rol) { return roles.contains(rol); }
}
