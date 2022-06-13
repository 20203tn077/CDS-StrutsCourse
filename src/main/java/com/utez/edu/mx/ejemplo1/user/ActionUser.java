package com.utez.edu.mx.ejemplo1.user;

import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ActionUser extends ActionSupport {
    private List<BeanUser> users;
    private BeanUser user;
    private String message;

    public String users() {
        return SUCCESS;
    }
}
