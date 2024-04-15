package modelo;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Base64;
import javax.swing.JOptionPane;

public class RegistrarDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    Conexion cn = new Conexion();
    
    public boolean registrarUsuario(registrar rg) {
        String sql = "INSERT INTO usuarios (nombre, correo, pass) VALUES (?,?,MD5(?))";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, rg.getNombre());
            ps.setString(2, rg.getCorreo());
            ps.setString(3, rg.getPass());
            
            ps.execute();
            
            return true;
        } catch(SQLException e) {
            JOptionPane.showMessageDialog(null, e.toString());
            
            return false;
        } finally {
            try {
                con.close();
            } catch(SQLException e) {
                System.out.println(e.toString());
            }
        }
    }
    
    public boolean usuarioExiste(registrar rg) {
        String sql = "SELECT * FROM usuarios WHERE nombre = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, rg.getNombre());
            
            rs = ps.executeQuery();
            
            return rs.next();
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
