package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDao {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    Conexion cn = new Conexion();
    
    public boolean registrarProveedor(Proveedor pr) {
        String sql = "INSERT INTO proveedor (ruc, nombre, telefono, direccion, razon) VALUES (?,?,?,?,?)";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, pr.getRuc());
            ps.setString(2, pr.getNombre());
            ps.setInt(3, pr.getTelefono());
            ps.setString(4, pr.getDireccion());
            ps.setString(5, pr.getRazon());
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        }
    }
    
    public List listarProveedor() {
        List<Proveedor> listaPr = new ArrayList();
        
        String sql = "SELECT * FROM proveedor";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Proveedor pr = new Proveedor();
                
                pr.setId(rs.getInt("id"));
                pr.setRuc(rs.getInt("ruc"));
                pr.setNombre(rs.getString("nombre"));
                pr.setTelefono(rs.getInt("Telefono"));
                pr.setDireccion(rs.getString("direccion"));
                pr.setRazon(rs.getString("razon"));
                
                listaPr.add(pr);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return listaPr;
    }
    
    public boolean elimianarProveedor(int id) {
        String sql = "DELETE FROM proveedor WHERE id = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        }
    }
    
    public boolean modificarProveedor(Proveedor pr) {
        
        String sql = "UPDATE proveedor SET ruc=?, nombre=?, telefono=?, direccion=?, razon=? WHERE id=?";
        
        try {
            
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, pr.getRuc());
            ps.setString(2, pr.getNombre());
            ps.setInt(3, pr.getTelefono());
            ps.setString(4, pr.getDireccion());
            ps.setString(5, pr.getRazon());
            ps.setInt(6, pr.getId());
            
            ps.execute();
            
            return true;
            
        } catch (SQLException e) {
            
            System.out.println(e.toString());
            
            return false;
            
        } finally {
            
            try {
                
                con.close();
                
            } catch (SQLException e) {
                
                System.out.println(e.toString());
                
            }
        }
    }
}
