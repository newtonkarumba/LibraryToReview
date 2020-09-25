package com.assignment.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.*;


@Entity
@Table(name = "lib_members")
public class Student implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Mid;


    @Column
    private String name;

    @Column
    private String address;

    @Column
    private String regNo;

    @Column
    private Date expiryDate;

    @Transient
    private String action;


    public int getMid() {
        return Mid;
    }

    public void setMid(int mid) {
        Mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
