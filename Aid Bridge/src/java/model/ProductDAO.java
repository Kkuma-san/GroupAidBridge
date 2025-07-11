package model;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private Connection getConnection() throws SQLException {
        String url = "jdbc:derby://localhost:1527/UserDatabase;create=true";
        String user = "app";
        String password = "app";
        return DriverManager.getConnection(url, user, password);
    }

    public List<Product> getAllProducts(String search, String sort) {
        List<Product> productList = new ArrayList<>();

        StringBuilder query = new StringBuilder("SELECT * FROM Products");

        boolean hasSearch = search != null && !search.trim().isEmpty();
        if (hasSearch) {
            query.append(" WHERE LOWER(name) LIKE ?");
        }

        if (sort != null) {
            switch (sort) {
                case "name_asc": query.append(" ORDER BY name ASC"); break;
                case "name_desc": query.append(" ORDER BY name DESC"); break;
                case "price_asc": query.append(" ORDER BY price ASC"); break;
                case "price_desc": query.append(" ORDER BY price DESC"); break;
                default: break;
            }
        }

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query.toString())) {

            if (hasSearch) {
                stmt.setString(1, "%" + search.toLowerCase() + "%");
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                productList.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public Product getProductById(int id) {
    Product product = null;
    try (Connection conn = getConnection()) {
        String sql = "SELECT * FROM products WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setImage(rs.getString("image"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return product;
}


    public List<Product> getAllProducts() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}

