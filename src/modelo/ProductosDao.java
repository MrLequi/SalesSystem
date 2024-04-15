package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JComboBox;

public class ProductosDao {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    Conexion cn = new Conexion();
    
    public boolean registrarProductos(Productos pro) {
        String sql = "INSERT INTO productos (codigo, nombre, proveedor, stock, precio) VALUES (?,?,?,?,?)";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, pro.getCodigo());
            ps.setString(2, pro.getNombre());
            ps.setString(3, pro.getProveedor());
            ps.setInt(4, pro.getStock());
            ps.setDouble(5, pro.getPrecio());
            
            ps.execute();
            
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            
            return false;
        }
    }
    
    public void consultarProveedor(JComboBox proveedor) {
        String sql = "SELECT nombre FROM proveedor";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                proveedor.addItem(rs.getString("nombre"));
            }
            
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
    }
    
    public List listarProductos() {
        List<Productos> listaPro = new ArrayList();
        
        String sql = "SELECT * FROM productos";
        
        try {

            con = cn.getConnection();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();

            while(rs.next()) {
                Productos pro = new Productos();

                pro.setId(rs.getInt("id"));
                pro.setCodigo(rs.getString("codigo"));
                pro.setNombre(rs.getString("nombre"));
                pro.setProveedor(rs.getString("proveedor"));
                pro.setStock(rs.getInt("stock"));
                pro.setPrecio(rs.getDouble("precio"));

                listaPro.add(pro);
            }

        } catch(SQLException e) {
            System.out.println(e.toString());
        }

        return listaPro;
    }
    
    public boolean eliminarProductos(int id) {
        String sql = "DELETE FROM productos WHERE id = ?";
        
        try {
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
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
    }
    
    public boolean modificarProductos(Productos pro) {
        String sql = "UPDATE productos SET codigo = ?, nombre = ?, proveedor = ?, stock = ?, precio = ? WHERE id = ?";
        
        try {
            ps = con.prepareStatement(sql);
            
            ps.setString(1, pro.getCodigo());
            ps.setString(2, pro.getNombre());
            ps.setString(3, pro.getProveedor());
            ps.setInt(4, pro.getStock());
            ps.setDouble(5, pro.getPrecio());
            ps.setInt(6, pro.getId());
            
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
    
    public Productos buscarPro(String codigo) {
        Productos producto = new Productos();
        String sql = "SELECT * FROM productos WHERE codigo = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, codigo);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        
        return producto;
    }
    
        public boolean modificarDatos(Config conf) {
        String sql = "UPDATE config SET ruc = ?, nombre = ?, telefono = ?, direccion = ?, razon = ? WHERE id = ?";
        
        try {
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, conf.getRuc());
            ps.setString(2, conf.getNombre());
            ps.setInt(3, conf.getTelefono());
            ps.setString(4, conf.getDireccion());
            ps.setString(5, conf.getRazon());
            ps.setInt(6, conf.getId());
            
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
