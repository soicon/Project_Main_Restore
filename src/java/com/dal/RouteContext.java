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
public class RouteContext extends DBContext {

    public RouteContext() throws Exception {
        super("route");
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize(); //To change body of generated methods, choose Tools | Templates.
    }

    public String getRoute(String code) throws SQLException {
        String sql = "select route from info where code=?";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, code);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString(1);
        } else {
            return "";
        }
    }

    public ArrayList<String> getCode() throws SQLException {
        String sql = "select code from info";
        ArrayList<String> p = new ArrayList<>();
        PreparedStatement ps = getConnection().prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            p.add(rs.getString(1));
        }
        return p;
    }

    public double getFare(String code) throws SQLException {
        String sql = "select fare from info where code=?";

        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, code);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getDouble(1);
        } else {
            return 0;
        }
    }

}
