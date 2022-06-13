package com.utez.edu.mx.ejemplo1.status;

import com.utez.edu.mx.ejemplo1.role.BeanRole;
import com.utez.edu.mx.ejemplo1.utils.ConnectionMySQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoStatus {
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;
    public List<BeanStatus> getAllStatuses() {
        List<BeanStatus> statuses = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            pstm = con.prepareStatement("SELECT status.id, status.name FROM status");
            rs = pstm.executeQuery();
            while (rs.next()) {
                statuses.add(new BeanStatus(
                        rs.getInt("id"),
                        rs.getString("name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm);
        }
        return statuses;
    }

    public static void main(String[] args) {
        for (BeanStatus status : new DaoStatus().getAllStatuses()) {
            System.out.println(status.getName());
        }
    }
}
