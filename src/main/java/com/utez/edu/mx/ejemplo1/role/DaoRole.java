package com.utez.edu.mx.ejemplo1.role;

import com.utez.edu.mx.ejemplo1.status.BeanStatus;
import com.utez.edu.mx.ejemplo1.utils.ConnectionMySQL;

import javax.management.relation.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoRole {
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;

    public boolean createRole(BeanRole role) {
        boolean success = false;
        try {
            con = ConnectionMySQL.getConnection();
            pstm = con.prepareStatement("INSERT INTO role (role.name, role.status_id) VALUES (?,?)");
            pstm.setString(1, role.getName());
            pstm.setInt(2, role.getStatus().getId());
            success = pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm);
        }
        return success;
    }

    public List<BeanRole> getAllRoles() {
        List<BeanRole> roles = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            pstm = con.prepareStatement("SELECT role.id, role.name, status.id as status_id, status.name as status_name FROM role INNER JOIN status ON(role.status_id = status.id)");
            rs = pstm.executeQuery();
            while (rs.next()) {
                roles.add(new BeanRole(
                        rs.getInt("id"),
                        rs.getString("name"),
                        new BeanStatus(
                                rs.getInt("status_id"),
                                rs.getString("status_name")
                        )
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm);
        }
        return roles;
    }

    public static void main(String[] args) {
        new DaoRole().updateRole(new BeanRole(
                3,
                "ASDASDASD",
                new BeanStatus(2)
        ));
//        System.out.println(new DaoRole().createRole(new BeanRole(
//                "Admin",
//                new BeanStatus(
//                        1
//                )
//        )) ? "Exito" : "Error");
//        System.out.println(new DaoRole().createRole(new BeanRole(
//                "User",
//                new BeanStatus(
//                        1
//                )
//        )) ? "Exito" : "Error");
//        for (BeanRole role : new DaoRole().getAllRoles()) {
//            System.out.println(role.getName());
//        }
    }

    public boolean updateRole(BeanRole role) {
        boolean success = false;
        try {
            con = ConnectionMySQL.getConnection();
            pstm = con.prepareStatement("UPDATE role SET role.name=?, role.status_id=? WHERE role.id=?");
            pstm.setString(1, role.getName());
            pstm.setInt(2, role.getStatus().getId());
            pstm.setInt(3, role.getId());
            success = pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm);
        }
        return success;
    }

//    try {
//        con = ConnectionMySQL.getConnection();
//    } catch (SQLException e) {
//        e.printStackTrace();
//    } finally {
//        ConnectionMySQL.closeConnection(con, pstm);
//    }
}
