package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "zhuanye")
public class Zhuanye implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "zhuanyemingcheng")
    private String zhuanyemingcheng;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZhuanyemingcheng() {
        return zhuanyemingcheng;
    }

    public void setZhuanyemingcheng(String zhuanyemingcheng) {
        this.zhuanyemingcheng = zhuanyemingcheng;
    }
}
