package org.example.assignment6.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class PoolVO {
    private int id;
    private String name;
    int age;
    private String phonenum;
    private String email;
    private String gender;
    private String type;
    private Date regDate;
    private String filename;

    public PoolVO(String name, int age, String phonenum, String email, String gender, String type, String filename) {
        this.name = name;
        this.age = age;
        this.phonenum = phonenum;
        this.email = email;
        this.gender = gender;
        this.type = type;
        this.filename = filename;
    }

    public PoolVO(String filename) {
        this.filename = filename;
    }

    public PoolVO(int id, String name, int age, String phonenum, String email, String gender, String type, String filename) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.phonenum = phonenum;
        this.email = email;
        this.gender = gender;
        this.type = type;
        this.filename = filename;
    }

    public PoolVO() {
    }
}
