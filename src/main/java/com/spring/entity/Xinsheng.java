package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "xinsheng")
public class Xinsheng implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "xuehao")
    private String xuehao;

    @Column(name = "mima")
    private String mima;

    @Column(name = "xingming")
    private String xingming;

    @Column(name = "xingbie")
    private String xingbie;

    @Column(name = "shengyuandi")
    private String shengyuandi;

    @Column(name = "xueyuan")
    private String xueyuan;

    @Column(name = "zhuanye")
    private String zhuanye;

    @Column(name = "banji")
    private String banji;

    @Column(name = "lianxifangshi")
    private String lianxifangshi;

    @Column(name = "xueshengjianjie")
    private String xueshengjianjie;

    @Column(name = "shifoufenpeisushe")
    private String shifoufenpeisushe;

    @Column(name = "suozaisushehao")
    private String suozaisushehao;

    @Column(name = "chuangweihao")
    private String chuangweihao;

    @Column(name = "shifouyijiaoxuefei")
    private String shifouyijiaoxuefei;

    @Column(name = "sushejiaofei")
    private String sushejiaofei;

    private String issh;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXuehao() {
        return xuehao;
    }

    public void setXuehao(String xuehao) {
        this.xuehao = xuehao;
    }

    public String getMima() {
        return mima;
    }

    public void setMima(String mima) {
        this.mima = mima;
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

    public String getShengyuandi() {
        return shengyuandi;
    }

    public void setShengyuandi(String shengyuandi) {
        this.shengyuandi = shengyuandi;
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

    public String getSuozaisushehao() {
        return suozaisushehao;
    }

    public void setSuozaisushehao(String suozaisushehao) {
        this.suozaisushehao = suozaisushehao;
    }

    public String getChuangweihao() {
        return chuangweihao;
    }

    public void setChuangweihao(String chuangweihao) {
        this.chuangweihao = chuangweihao;
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

    public String getIssh() {
        return issh;
    }

    public void setIssh(String issh) {
        this.issh = issh;
    }
}
