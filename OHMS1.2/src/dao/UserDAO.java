package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public static boolean createUser(String email, String passwordHash, String role, String fullName)
            throws SQLException {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (email, password_hash, role, full_name) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, passwordHash);
                ps.setString(3, role);
                ps.setString(4, fullName);
                ps.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
            String msg = e.getMessage() == null ? "" : e.getMessage().toLowerCase();
            if (msg.contains("unique") || msg.contains("constraint") || e.getErrorCode() == 23505) {
                return false;
            }
            throw e;
        }
    }

    public static boolean authenticate(String email, String passwordHash, String role) throws SQLException {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id FROM users WHERE email = ? AND password_hash = ? AND role = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, passwordHash);
                ps.setString(3, role);
                try (ResultSet rs = ps.executeQuery()) {
                    return rs.next();
                }
            }
        }
    }
}
