package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "xueshengxinxi")
public class Xueshengxinxi implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "xinshengxinxiid")
    private Integer xinshengxinxiid;

    @Column(name = "yonghuming")
    private String yonghuming;

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

    @Column(name = "lianxifangshi")
    private String lianxifangshi;

    @Column(name = "suozaisushehao")
    private String suozaisushehao;

    @Column(name = "xueshengjianjie")
    private String xueshengjianjie;

    @Column(name = "shifoufenpeisushe")
    private String shifoufenpeisushe;

    @Column(name = "shifouyijiaoxuefei")
    private String shifouyijiaoxuefei;

    @Column(name = "sushejiaofei")
    private String sushejiaofei;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getXinshengxinxiid() {
        return xinshengxinxiid;
    }

    public void setXinshengxinxiid(Integer xinshengxinxiid) {
        this.xinshengxinxiid = xinshengxinxiid;
    }

    public String getYonghuming() {
        return yonghuming;
    }

    public void setYonghuming(String yonghuming) {
        this.yonghuming = yonghuming;
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

    public String getLianxifangshi() {
        return lianxifangshi;
    }

    public void setLianxifangshi(String lianxifangshi) {
        this.lianxifangshi = lianxifangshi;
    }

    public String getSuozaisushehao() {
        return suozaisushehao;
    }

    public void setSuozaisushehao(String suozaisushehao) {
        this.suozaisushehao = suozaisushehao;
    }

    public String getXueshengjianjie() {
        return xueshengjianjie;
    }

    public void setXueshengjianjie(String xueshengjianjie) {
        this.xueshengjianjie = xueshengjianjie;
    }

    public String getShifoufenpeisushe() {
        return shifoufenpeisushe;
    }

    public void setShifoufenpeisushe(String shifoufenpeisushe) {
        this.shifoufenpeisushe = shifoufenpeisushe;
    }

    public String getShifouyijiaoxuefei() {
        return shifouyijiaoxuefei;
    }

    public void setShifouyijiaoxuefei(String shifouyijiaoxuefei) {
        this.shifouyijiaoxuefei = shifouyijiaoxuefei;
    }

    public String getSushejiaofei() {
        return sushejiaofei;
    }

    public void setSushejiaofei(String sushejiaofei) {
        this.sushejiaofei = sushejiaofei;
    }
}
