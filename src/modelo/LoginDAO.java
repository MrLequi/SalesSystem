package modelo;

import java.sql.*;

public class LoginDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    
    public login log(String correo, String pass) {
        login l = new login();
        
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND pass = MD5(?)";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, correo);
            ps.setString(2, pass);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                l.setId(rs.getInt("id"));
                l.setNombre(rs.getString("nombre"));
                l.setCorreo(rs.getString("correo"));
                l.setPass(rs.getString("pass"));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        
        return l;
    }
}
