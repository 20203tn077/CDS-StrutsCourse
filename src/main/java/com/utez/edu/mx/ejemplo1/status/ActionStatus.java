package com.utez.edu.mx.ejemplo1.status;

import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class ActionStatus extends ActionSupport {
    private List<BeanStatus> statuses;

    public String findAllStatuses() {
        statuses = new DaoStatus().getAllStatuses();
        return SUCCESS;
    }

    public List<BeanStatus> getStatuses() {
        return statuses;
    }
}
