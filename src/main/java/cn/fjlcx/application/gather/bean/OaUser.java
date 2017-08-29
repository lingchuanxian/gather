package cn.fjlcx.application.gather.bean;

import java.util.Date;

public class OaUser {
    private Integer usId;
    private String usLoginname;
    private String usPwd;
    private Integer usRole;
    private String usHead;
    private String usName;
    /**
     * 0：男
       1：女
     */
    private Integer usSex;

    private String usPhone;

    private String usMail;

    private String usAddress;

    /**
     * 0：正常
       1：禁用
     */
    private Integer usState;

    private Date usRegistdate;

    private Date usLastlogindate;

    private String role;

    public Integer getUsId() {
        return usId;
    }

    public void setUsId(Integer usId) {
        this.usId = usId;
    }

    public String getUsLoginname() {
        return usLoginname;
    }

    public void setUsLoginname(String usLoginname) {
        this.usLoginname = usLoginname;
    }

    public String getUsPwd() {
        return usPwd;
    }

    public void setUsPwd(String usPwd) {
        this.usPwd = usPwd;
    }

    public Integer getUsRole() {
        return usRole;
    }

    public void setUsRole(Integer usRole) {
        this.usRole = usRole;
    }

    public String getUsHead() {
        return usHead;
    }

    public void setUsHead(String usHead) {
        this.usHead = usHead;
    }

    public String getUsName() {
        return usName;
    }

    public void setUsName(String usName) {
        this.usName = usName;
    }

    public Integer getUsSex() {
        return usSex;
    }

    public void setUsSex(Integer usSex) {
        this.usSex = usSex;
    }

    public String getUsPhone() {
        return usPhone;
    }

    public void setUsPhone(String usPhone) {
        this.usPhone = usPhone;
    }

    public String getUsMail() {
        return usMail;
    }

    public void setUsMail(String usMail) {
        this.usMail = usMail;
    }

    public String getUsAddress() {
        return usAddress;
    }

    public void setUsAddress(String usAddress) {
        this.usAddress = usAddress;
    }

    public Integer getUsState() {
        return usState;
    }

    public void setUsState(Integer usState) {
        this.usState = usState;
    }

    public Date getUsRegistdate() {
        return usRegistdate;
    }

    public void setUsRegistdate(Date usRegistdate) {
        this.usRegistdate = usRegistdate;
    }

    public Date getUsLastlogindate() {
        return usLastlogindate;
    }

    public void setUsLastlogindate(Date usLastlogindate) {
        this.usLastlogindate = usLastlogindate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public OaUser(Integer usId, String usLoginname, String usPwd, Integer usRole, String usHead, String usName, Integer usSex, String usPhone, String usMail, String usAddress, Integer usState, Date usRegistdate, Date usLastlogindate, String role) {
        this.usId = usId;
        this.usLoginname = usLoginname;
        this.usPwd = usPwd;
        this.usRole = usRole;
        this.usHead = usHead;
        this.usName = usName;
        this.usSex = usSex;
        this.usPhone = usPhone;
        this.usMail = usMail;
        this.usAddress = usAddress;
        this.usState = usState;
        this.usRegistdate = usRegistdate;
        this.usLastlogindate = usLastlogindate;
        this.role = role;
    }

    public OaUser() {
    }

    @Override
    public String toString() {
        return "OaUser{" +
                "usId=" + usId +
                ", usLoginname='" + usLoginname + '\'' +
                ", usPwd='" + usPwd + '\'' +
                ", usRole=" + usRole +
                ", usHead='" + usHead + '\'' +
                ", usName='" + usName + '\'' +
                ", usSex=" + usSex +
                ", usPhone='" + usPhone + '\'' +
                ", usMail='" + usMail + '\'' +
                ", usAddress='" + usAddress + '\'' +
                ", usState=" + usState +
                ", usRegistdate=" + usRegistdate +
                ", usLastlogindate=" + usLastlogindate +
                ", role='" + role + '\'' +
                '}';
    }
}