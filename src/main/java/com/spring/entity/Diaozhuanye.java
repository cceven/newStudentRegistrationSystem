package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "diaozhuanye")
public class Diaozhuanye implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "xinshengid")
    private Integer xinshengid;

    @Column(name = "xuehao")
    private String xuehao;

    @Column(name = "xingming")
    private String xingming;

    @Column(name = "xueyuan")
    private String xueyuan;

    @Column(name = "zhuanye")
    private String zhuanye;

    @Column(name = "banji")
    private String banji;

    @Column(name = "shenqingbianhao")
    private String shenqingbianhao;

    @Column(name = "shenqingshijian")
    private String shenqingshijian;

    @Column(name = "diaodaoxueyuan")
    private String diaodaoxueyuan;

    @Column(name = "diaodaozhuanye")
    private String diaodaozhuanye;

    @Column(name = "diaodaobanji")
    private String diaodaobanji;

    @Column(name = "shenqingmiaoshu")
    private String shenqingmiaoshu;

    @Column(name = "shenqingxuesheng")
    private String shenqingxuesheng;

    @Column(name = "shenqingzhuangtai")
    private String shenqingzhuangtai;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getXinshengid() {
        return xinshengid;
    }

    public void setXinshengid(Integer xinshengid) {
        this.xinshengid = xinshengid;
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

    public String getShenqingbianhao() {
        return shenqingbianhao;
    }

    public void setShenqingbianhao(String shenqingbianhao) {
        this.shenqingbianhao = shenqingbianhao;
    }

    public String getShenqingshijian() {
        return shenqingshijian;
    }

    public void setShenqingshijian(String shenqingshijian) {
        this.shenqingshijian = shenqingshijian;
    }

    public String getDiaodaoxueyuan() {
        return diaodaoxueyuan;
    }

    public void setDiaodaoxueyuan(String diaodaoxueyuan) {
        this.diaodaoxueyuan = diaodaoxueyuan;
    }

    public String getDiaodaozhuanye() {
        return diaodaozhuanye;
    }

    public void setDiaodaozhuanye(String diaodaozhuanye) {
        this.diaodaozhuanye = diaodaozhuanye;
    }

    public String getDiaodaobanji() {
        return diaodaobanji;
    }

    public void setDiaodaobanji(String diaodaobanji) {
        this.diaodaobanji = diaodaobanji;
    }

    public String getShenqingmiaoshu() {
        return shenqingmiaoshu;
    }

    public void setShenqingmiaoshu(String shenqingmiaoshu) {
        this.shenqingmiaoshu = shenqingmiaoshu;
    }

    public String getShenqingxuesheng() {
        return shenqingxuesheng;
    }

    public void setShenqingxuesheng(String shenqingxuesheng) {
        this.shenqingxuesheng = shenqingxuesheng;
    }

    public String getShenqingzhuangtai() {
        return shenqingzhuangtai;
    }

    public void setShenqingzhuangtai(String shenqingzhuangtai) {
        this.shenqingzhuangtai = shenqingzhuangtai;
    }
}
