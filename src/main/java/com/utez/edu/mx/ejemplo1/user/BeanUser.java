package com.utez.edu.mx.ejemplo1.user;

import com.utez.edu.mx.ejemplo1.person.BeanPerson;
import com.utez.edu.mx.ejemplo1.role.BeanRole;
import com.utez.edu.mx.ejemplo1.status.BeanStatus;

import java.util.List;

public class BeanUser {
    private int id;
    private String email;
    private String password;
    private String createdAt;
    private BeanStatus status;
    private BeanPerson person;
    private List<BeanRole> roles;

    public BeanUser() {
    }

    public BeanUser(String email, String password, String createdAt, BeanStatus status, BeanPerson person, List<BeanRole> roles) {
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
        this.status = status;
        this.person = person;
        this.roles = roles;
    }

    public BeanUser(int id, String email, String password, String createdAt, BeanStatus status, BeanPerson person, List<BeanRole> roles) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
        this.status = status;
        this.person = person;
        this.roles = roles;
    }

    public BeanUser(int id, String email, String createdAt, BeanStatus status, BeanPerson person) {
        this.id = id;
        this.email = email;
        this.createdAt = createdAt;
        this.status = status;
        this.person = person;
        this.roles = roles;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public BeanStatus getStatus() {
        return status;
    }

    public void setStatus(BeanStatus status) {
        this.status = status;
    }

    public BeanPerson getPerson() {
        return person;
    }

    public void setPerson(BeanPerson person) {
        this.person = person;
    }

    public List<BeanRole> getRoles() {
        return roles;
    }

    public void setRoles(List<BeanRole> roles) {
        this.roles = roles;
    }
}
