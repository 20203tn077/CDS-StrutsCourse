package com.utez.edu.mx.ejemplo1.person;

import com.utez.edu.mx.ejemplo1.role.BeanRole;
import com.utez.edu.mx.ejemplo1.status.BeanStatus;

public class BeanPerson {
    private int id;
    private String name;
    private String surname;
    private String lastname;
    private String birthdate;
    private String phone;

    public BeanPerson() {
    }

    public BeanPerson(String name, String surname, String lastname, String birthdate, String phone) {
        this.name = name;
        this.surname = surname;
        this.lastname = lastname;
        this.birthdate = birthdate;
        this.phone = phone;
    }

    public BeanPerson(int id, String name, String surname, String lastname, String birthdate, String phone) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.lastname = lastname;
        this.birthdate = birthdate;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
