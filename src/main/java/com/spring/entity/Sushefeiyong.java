package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sushefeiyong")
public class Sushefeiyong implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "feiyongbianhao")
    private String feiyongbianhao;

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

    @Column(name = "suozaisushehao")
    private String suozaisushehao;

    @Column(name = "chuangweihao")
    private String chuangweihao;

    @Column(name = "sushefei")
    private Double sushefei;

    @Column(name = "jiaofeizhuangtai")
    private String jiaofeizhuangtai;

    private String iszf;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFeiyongbianhao() {
        return feiyongbianhao;
    }

    public void setFeiyongbianhao(String feiyongbianhao) {
        this.feiyongbianhao = feiyongbianhao;
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

    public Double getSushefei() {
        return sushefei;
    }

    public void setSushefei(Double sushefei) {
        this.sushefei = sushefei;
    }

    public String getJiaofeizhuangtai() {
        return jiaofeizhuangtai;
    }

    public void setJiaofeizhuangtai(String jiaofeizhuangtai) {
        this.jiaofeizhuangtai = jiaofeizhuangtai;
    }

    public String getIszf() {
        return iszf;
    }

    public void setIszf(String iszf) {
        this.iszf = iszf;
    }
}
