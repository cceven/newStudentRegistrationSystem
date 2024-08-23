package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sushefenpei")
public class Sushefenpei implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "sushexinxiid")
    private Integer sushexinxiid;

    @Column(name = "sushehao")
    private String sushehao;

    @Column(name = "susheleixing")
    private String susheleixing;

    @Column(name = "chuangweihao")
    private String chuangweihao;

    @Column(name = "xuesheng")
    private Integer xuesheng;

    @Column(name = "xuehao")
    private String xuehao;

    @Column(name = "xingming")
    private String xingming;

    @Column(name = "xingbie")
    private String xingbie;

    @Column(name = "xueyuan")
    private String xueyuan;

    @Column(name = "zhuanye")
    private String zhuanye;

    @Column(name = "banji")
    private String banji;

    @Column(name = "fenpeishijian")
    private String fenpeishijian;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSushexinxiid() {
        return sushexinxiid;
    }

    public void setSushexinxiid(Integer sushexinxiid) {
        this.sushexinxiid = sushexinxiid;
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

    public String getChuangweihao() {
        return chuangweihao;
    }

    public void setChuangweihao(String chuangweihao) {
        this.chuangweihao = chuangweihao;
    }

    public Integer getXuesheng() {
        return xuesheng;
    }

    public void setXuesheng(Integer xuesheng) {
        this.xuesheng = xuesheng;
    }

    public String getXuehao() {
        return xuehao;
    }

    public void setXuehao(String xuehao) {
        this.xuehao = xuehao;
    }

    public String getXingming() {
        return xingming;
    }

    public void setXingming(String xingming) {
        this.xingming = xingming;
    }

    public String getXingbie() {
        return xingbie;
    }

    public void setXingbie(String xingbie) {
        this.xingbie = xingbie;
    }

    public String getXueyuan() {
        return xueyuan;
    }

    public void setXueyuan(String xueyuan) {
        this.xueyuan = xueyuan;
    }

    public String getZhuanye() {
        return zhuanye;
    }

    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye;
    }

    public String getBanji() {
        return banji;
    }

    public void setBanji(String banji) {
        this.banji = banji;
    }

    public String getFenpeishijian() {
        return fenpeishijian;
    }

    public void setFenpeishijian(String fenpeishijian) {
        this.fenpeishijian = fenpeishijian;
    }
}
