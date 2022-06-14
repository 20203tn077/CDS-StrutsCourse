package com.utez.edu.mx.ejemplo1.role;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ActionRole extends ActionSupport {
    private List<BeanRole> roles;
    private String data;

    public String createRole() {
        System.out.println(data);
        if (new DaoRole().createRole(new Gson().fromJson(data, BeanRole.class))) return SUCCESS;
        else return ERROR;
    }

    public String updateRole() {
        System.out.println(data);
        if (new DaoRole().updateRole(new Gson().fromJson(data, BeanRole.class))) return SUCCESS;
        else return ERROR;
    }

    public String findAllRoles() {
        roles = new DaoRole().getAllRoles();
        return SUCCESS;
    }

    public void setData(String data) {
        this.data = data;
    }

    public List<BeanRole> getRoles() {
        return roles;
    }
}
