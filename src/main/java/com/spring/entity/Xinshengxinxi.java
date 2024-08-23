package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "xinshengxinxi")
public class Xinshengxinxi implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "yonghuming")
    private String yonghuming;

    @Column(name = "mima")
    private String mima;

    @Column(name = "xingming")
    private String xingming;

    @Column(name = "xingbie")
    private String xingbie;

    @Column(name = "lianxifangshi")
    private String lianxifangshi;

    @Column(name = "shifouxinsheng")
    private String shifouxinsheng;

    @Column(name = "sushehao")
    private String sushehao;

    @Column(name = "fenpeisushe")
    private String fenpeisushe;

    @Column(name = "xuefeijiaofei")
    private String xuefeijiaofei;

    @Column(name = "sushejiaofei")
    private String sushejiaofei;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYonghuming() {
        return yonghuming;
    }

    public void setYonghuming(String yonghuming) {
        this.yonghuming = yonghuming;
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

    public String getLianxifangshi() {
        return lianxifangshi;
    }

    public void setLianxifangshi(String lianxifangshi) {
        this.lianxifangshi = lianxifangshi;
    }

    public String getShifouxinsheng() {
        return shifouxinsheng;
    }

    public void setShifouxinsheng(String shifouxinsheng) {
        this.shifouxinsheng = shifouxinsheng;
    }

    public String getSushehao() {
        return sushehao;
    }

    public void setSushehao(String sushehao) {
        this.sushehao = sushehao;
    }

    public String getFenpeisushe() {
        return fenpeisushe;
    }

    public void setFenpeisushe(String fenpeisushe) {
        this.fenpeisushe = fenpeisushe;
    }

    public String getXuefeijiaofei() {
        return xuefeijiaofei;
    }

    public void setXuefeijiaofei(String xuefeijiaofei) {
        this.xuefeijiaofei = xuefeijiaofei;
    }

    public String getSushejiaofei() {
        return sushejiaofei;
    }

    public void setSushejiaofei(String sushejiaofei) {
        this.sushejiaofei = sushejiaofei;
    }
}
