package dao;

import model.Wine;
import utils.ConnectionFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WineDAO {

    public void insertWine(Wine wine) {

        String sql = "INSERT INTO WINE (id, name, description, price) VALUES (?, ?, ?, ?)";

        try (Connection connection = ConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, wine.getId());
            stmt.setString(2, wine.getName());
            stmt.setString(3, wine.getDescription());
            stmt.setDouble(4, wine.getPrice());
            stmt.setString(5, wine.getImage());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir vinho", e);
        }
    }

    public List<Wine> list() {

        List<Wine> list = new ArrayList<>();

        String sql = "SELECT * FROM WINE";

        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Wine wine = new Wine();

                wine.setId(rs.getInt("id"));
                wine.setName(rs.getString("name"));
                wine.setDescription(rs.getString("description"));
                wine.setPrice(rs.getDouble("price"));
                wine.setImage(rs.getString("image"));

                list.add(wine);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar vinhos", e);
        }

        return list;
    }
}