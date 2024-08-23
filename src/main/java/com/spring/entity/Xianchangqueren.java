package com.spring.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "xianchangqueren")
public class Xianchangqueren implements Serializable {

    private static final long serialVersionUID = 1L;

    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id", insertable = false)
    private Integer id;

    @Column(name = "xinshengxinxiid")
    private Integer xinshengxinxiid;

    @Column(name = "yonghuming")
    private String yonghuming;

    @Column(name = "xingming")
    private String xingming;

    @Column(name = "xingbie")
    private String xingbie;

    @Column(name = "lianxifangshi")
    private String lianxifangshi;

    @Column(name = "shifouxinsheng")
    private String shifouxinsheng;

    @Column(name = "beizhu")
    private String beizhu;

    @Column(name = "caozuoren")
    private String caozuoren;

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

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String getCaozuoren() {
        return caozuoren;
    }

    public void setCaozuoren(String caozuoren) {
        this.caozuoren = caozuoren;
    }
}
