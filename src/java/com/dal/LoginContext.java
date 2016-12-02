/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author dung nguyen
 */
public class LoginContext extends DBContext {

    public LoginContext() throws Exception {
        super("login");
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize(); //To change body of generated methods, choose Tools | Templates.
    }

    public String getUID(String id) throws SQLException {

        String sql = "select uid from UserData where uid=?";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString(1);
        } else {
            return "";
        }
    }

    public int isDuplicate(String uid) throws SQLException {

        String sql = "select uid from UserData";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ArrayList<String> p = new ArrayList();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            p.add(rs.getString(1));
        }
        for (String x : p) {
            if (uid.equalsIgnoreCase(x)) {
                return 0;
            }

        }
        return 1;
    }

    public String getPass(String id) throws SQLException {
        String sql = "select pwd from UserData where uid=?";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString(1);
        } else {
            return "";
        }
    }

    public void register(String uid, String pass, String mode) throws SQLException {
        String sql = "insert into UserData values(?,?,?,?)";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        int rowCount = getRowCount();
        ps.setString(1, uid);
        ps.setString(2, pass);
        ps.setString(3, mode);
        ps.setInt(4, (rowCount != -1) ? rowCount + 1 : -1);
        ps.executeUpdate();
    }

    public String getMode(String id) throws SQLException {
        String sql = "select mode from UserData where uid=?";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString(1);
        } else {
            return "";
        }
    }

    public int getRowCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM UserData";
        PreparedStatement ps = getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        } else {
            return -1;
        }
    }

    public void changePass(String id,String pwd) throws SQLException {
        String sql = "update UserData set pwd =? where uid = ?";
        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, pwd);
        ps.setString(2, id);
        ps.executeUpdate();
    }

}
