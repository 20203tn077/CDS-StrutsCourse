package com.utez.edu.mx.ejemplo1.user;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.utez.edu.mx.ejemplo1.role.DaoRole;

import java.util.List;

public class ActionUser extends ActionSupport {
    private List<BeanUser> users;
    private String message;
    private String data;


    public String users () {
        return SUCCESS;
    }
    public String findAllUsers() {
        users = new DaoUser().getAll();
        message = "OK";
        return SUCCESS;
    }
    public String createUser() {
        message = (new DaoUser().createUser(new Gson().fromJson(data, BeanUser.class))) ? "OK" : "ERROR";
        return SUCCESS;
    }
    public String updateUser() {
        message = (new DaoUser().update(new Gson().fromJson(data, BeanUser.class))) ? "OK" : "ERROR";
        return SUCCESS;
    }

    public List<BeanUser> getUsers() {
        return users;
    }

    public String getMessage() {
        return message;
    }
}
