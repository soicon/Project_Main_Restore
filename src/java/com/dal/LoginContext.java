/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public void register(String id, String pass,String mode) throws SQLException {
        String sql = "insert into UserData values(?,?,?)";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, pass);
         ps.setString(3, mode);
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

}
