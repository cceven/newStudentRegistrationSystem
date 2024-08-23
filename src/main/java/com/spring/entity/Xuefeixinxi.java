package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "xuefeixinxi")
public class Xuefeixinxi implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "xuefeibianhao")
    private String xuefeibianhao;

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

    @Column(name = "xuefeifeiyong")
    private Double xuefeifeiyong;

    @Column(name = "beizhu")
    private String beizhu;

    @Column(name = "jiaofeizhuangtai")
    private String jiaofeizhuangtai;

    @Column(name = "caozuoren")
    private String caozuoren;

    private String iszf;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXuefeibianhao() {
        return xuefeibianhao;
    }

    public void setXuefeibianhao(String xuefeibianhao) {
        this.xuefeibianhao = xuefeibianhao;
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

    public Double getXuefeifeiyong() {
        return xuefeifeiyong;
    }

    public void setXuefeifeiyong(Double xuefeifeiyong) {
        this.xuefeifeiyong = xuefeifeiyong;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String getJiaofeizhuangtai() {
        return jiaofeizhuangtai;
    }

    public void setJiaofeizhuangtai(String jiaofeizhuangtai) {
        this.jiaofeizhuangtai = jiaofeizhuangtai;
    }

    public String getCaozuoren() {
        return caozuoren;
    }

    public void setCaozuoren(String caozuoren) {
        this.caozuoren = caozuoren;
    }

    public String getIszf() {
        return iszf;
    }

    public void setIszf(String iszf) {
        this.iszf = iszf;
    }
}
