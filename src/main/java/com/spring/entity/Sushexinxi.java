package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sushexinxi")
public class Sushexinxi implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "sushehao")
    private String sushehao;

    @Column(name = "susheleixing")
    private String susheleixing;

    @Column(name = "sushechuangwei")
    private Integer sushechuangwei;

    @Column(name = "yizhurenshu")
    private Integer yizhurenshu;

    @Column(name = "sushewupin")
    private String sushewupin;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSushehao() {
        return sushehao;
    }

    public void setSushehao(String sushehao) {
        this.sushehao = sushehao;
    }

    public String getSusheleixing() {
        return susheleixing;
    }

    public void setSusheleixing(String susheleixing) {
        this.susheleixing = susheleixing;
    }

    public Integer getSushechuangwei() {
        return sushechuangwei;
    }

    public void setSushechuangwei(Integer sushechuangwei) {
        this.sushechuangwei = sushechuangwei;
    }

    public Integer getYizhurenshu() {
        return yizhurenshu;
    }

    public void setYizhurenshu(Integer yizhurenshu) {
        this.yizhurenshu = yizhurenshu;
    }

    public String getSushewupin() {
        return sushewupin;
    }

    public void setSushewupin(String sushewupin) {
        this.sushewupin = sushewupin;
    }
}
