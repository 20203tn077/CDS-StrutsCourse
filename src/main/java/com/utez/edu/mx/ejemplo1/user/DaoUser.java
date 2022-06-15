package com.utez.edu.mx.ejemplo1.user;

import com.utez.edu.mx.ejemplo1.person.BeanPerson;
import com.utez.edu.mx.ejemplo1.role.BeanRole;
import com.utez.edu.mx.ejemplo1.status.BeanStatus;
import com.utez.edu.mx.ejemplo1.utils.ConnectionMySQL;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class DaoUser {
    private Connection con;
    private PreparedStatement pstm;
    private ResultSet rs;

    public boolean createUser(BeanUser user) {
        System.out.println(user);
        boolean success = false;
        try {
            con = ConnectionMySQL.getConnection();
            // Insertar persona
            pstm = con.prepareStatement("INSERT INTO person (name, surname, lastname, birthdate, phone) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, user.getPerson().getName());
            pstm.setString(2, user.getPerson().getSurname());
            pstm.setString(3, user.getPerson().getLastname());
            pstm.setString(4, LocalDate.parse(user.getPerson().getBirthdate(), DateTimeFormatter.ISO_DATE_TIME).format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            pstm.setString(5, user.getPerson().getPhone());
            if (pstm.executeUpdate() == 1) {
                rs = pstm.getGeneratedKeys();
                if (rs.next()) {
                    user.getPerson().setId(rs.getInt(1));
                    // Insertar usuario
                    pstm = con.prepareStatement("INSERT INTO user (email, password, created_at, status_id, person_id) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
                    pstm.setString(1, user.getEmail());
                    pstm.setString(2, user.getPassword());
                    pstm.setString(3, user.getCreatedAt());
                    pstm.setInt(4, user.getStatus().getId());
                    pstm.setInt(5, user.getPerson().getId());
                    if (pstm.executeUpdate() == 1) {
                        rs = pstm.getGeneratedKeys();
                        if (rs.next()) {
                            user.setId(rs.getInt(1));
                            // Insertar registros de roles del usuario
                            success = true;
                            for (BeanRole role : user.getRoles()) {
                                pstm = con.prepareStatement("INSERT INTO role_has_user (role_id, user_id) VALUES (?, ?)");
                                pstm.setInt(1, role.getId());
                                pstm.setInt(2, user.getId());
                                success = pstm.executeUpdate() == 1 && success;
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm, rs);
        }
        return false;
    }

    public List<BeanUser> getAll() {
        List<BeanUser> users = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            pstm = con.prepareStatement("SELECT user.id, user.email, user.created_at, status.id AS status_id, status.name as status_name, person.id as person_id, person.name as person_name, person.surname as person_surname, person.lastname as person_lastname, person.birthdate as person_birthdate, person.phone as person_phone FROM user INNER JOIN status ON user.status_id = status.id INNER JOIN person ON user.person_id = person.id");
            rs = pstm.executeQuery();
            while (rs.next()) {
                // Llenar datos de usuario
                users.add(new BeanUser(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("created_at"),
                        // Llenar datos del status
                        new BeanStatus(
                                rs.getInt("status_id"),
                                rs.getString("status_name")
                        ),
                        // Llenar datos de la persona
                        new BeanPerson(
                                rs.getInt("person_id"),
                                rs.getString("person_name"),
                                rs.getString("person_surname"),
                                rs.getString("person_lastname"),
                                LocalDate.parse(rs.getString("person_birthdate"), DateTimeFormatter.ofPattern("yyyy-MM-dd")).format(DateTimeFormatter.ISO_DATE),
                                rs.getString("person_phone")
                        )

                ));
            }
            // Obtener los roles de cada usuario
            for (BeanUser user : users) {
                List<BeanRole> roles = new ArrayList<>();
                pstm = con.prepareStatement("SELECT role.id, role.name, status.id as status_id, status.name as status_name FROM role_has_user INNER JOIN role ON role_has_user.role_id = role.id INNER JOIN status ON role.status_id = status.id WHERE role_has_user.user_id = ?");
                pstm.setInt(1, user.getId());
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
                user.setRoles(roles);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm, rs);
        }
        return users;
    }

    public boolean update(BeanUser user) {
        boolean success = false;
        try {
            con = ConnectionMySQL.getConnection();
            // Actualizar datos de persona
            pstm = con.prepareStatement("UPDATE person SET name = ?, surname = ?, lastname = ?, birthdate = ?, phone = ? WHERE person.id = ?");
            pstm.setString(1, user.getPerson().getName());
            pstm.setString(2, user.getPerson().getSurname());
            pstm.setString(3, user.getPerson().getLastname());
            pstm.setString(4, LocalDate.parse(user.getPerson().getBirthdate(), DateTimeFormatter.ISO_DATE_TIME).format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            pstm.setString(5, user.getPerson().getPhone());
            pstm.setInt(6, user.getPerson().getId());
            success = pstm.executeUpdate() == 1;
            System.out.println("1 " + (success ? "OK" : "FALLÓ"));

            // Actualizar datos de usuario
            pstm = con.prepareStatement("UPDATE user SET email = ?, created_at = ?, status_id = ?, person_id = ? WHERE user.id = ?");
            pstm.setString(1, user.getEmail());
            pstm.setString(2, user.getCreatedAt());
            pstm.setInt(3, user.getStatus().getId());
            pstm.setInt(4, user.getPerson().getId());
            pstm.setInt(5, user.getId());
            success = pstm.executeUpdate() == 1 && success;
            System.out.println("2 " + (success ? "OK" : "FALLÓ"));

            // Actualizar contraseña si fue cambiada
            if (user.getPassword() != null) {
                pstm = con.prepareStatement("UPDATE user SET password = ? WHERE user.id = ?");
                pstm.setString(1, user.getEmail());
                pstm.setString(2, user.getCreatedAt());
                success = pstm.executeUpdate() == 1 && success;
                System.out.println("3 " + (success ? "OK" : "FALLÓ"));
            }

            // Obtener roles actuales del usuario
            List<BeanRole> roles = new ArrayList<>();
            pstm = con.prepareStatement("SELECT role.id, role.name, status.id as status_id, status.name as status_name FROM role_has_user INNER JOIN role ON role_has_user.role_id = role.id INNER JOIN status ON role.status_id = status.id WHERE role_has_user.user_id = ?");
            pstm.setInt(1, user.getId());
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

            // Obtener roles agregados
            List<BeanRole> rolesAdd = user.getRoles().stream().filter(role -> !isIn(role, roles)).collect(Collectors.toList());
            // Obtener roles removidos
            List<BeanRole> rolesRemove = roles.stream().filter(role -> !isIn(role, user.getRoles())).collect(Collectors.toList());
            System.out.println("ROLES " + roles.size());
            System.out.println("ROLES REMOVE " + rolesAdd.size());
            System.out.println("ROLES REMOVE " + rolesRemove.size());

            // Agregrar nuevos roles seleccionados
            for (BeanRole role : rolesAdd) {
                pstm = con.prepareStatement("INSERT INTO role_has_user (role_id, user_id) VALUES (?, ?)");
                pstm.setInt(1, role.getId());
                pstm.setInt(2, user.getId());
                success = pstm.executeUpdate() == 1 && success;
                System.out.println("4 " + (success ? "OK" : "FALLÓ"));
            }
            // Eliminar roles removidos
            for (BeanRole role : rolesRemove) {
                pstm = con.prepareStatement("DELETE FROM role_has_user WHERE user_id = ?");
                pstm.setInt(1, user.getId());
                success = pstm.executeUpdate() == 1 && success;
                System.out.println("5 " + (success ? "OK" : "FALLÓ"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionMySQL.closeConnection(con, pstm, rs);
        }
        return success;
    }

    private boolean isIn(BeanRole role, List<BeanRole> list) {
        for (BeanRole i : list) {
            if (i.getId() == role.getId()) return true;
        }
        return false;
    }
}
