package com.dal;

import com.entities.Booking;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BookingContext extends DBContext {

    public BookingContext() throws Exception {

        super("db_booking");
    }

    //close connection will be done automatically by gc
    @Override
    protected void finalize() throws Throwable {
        super.close();
    }

    //get all products
    public List<Booking> getProducts() throws Exception {
        List<Booking> p = new ArrayList<Booking>();
        String sql = "select * from detail";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {

            String id = rs.getString(1);
            String name = rs.getString(2);
            String flight_number = rs.getString(3);
            String route = rs.getString(4);
            String date = rs.getString(5);
            int isOpen = rs.getInt(6);
            double fare = rs.getDouble(7);
            String depart = rs.getString(8);
            String arrival = rs.getString(9);
            Booking x = new Booking(id, name, flight_number, route, date, isOpen, fare, depart, arrival);
            p.add(x);
        }
        return p;
    }

    public void addBooking(Booking e) throws Exception {
        String sql = "insert into detail values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = getConnection().prepareStatement(sql);
        ps.setString(1, e.getId());
        ps.setString(2, e.getCus_name());
        ps.setString(3, e.getFlight_number());
        ps.setString(4, e.getRoute());
        ps.setString(5, e.getDate());
        ps.setInt(6, e.getIsOpen());
        ps.setDouble(7, e.getFare());
        ps.setString(8,e.getDeparture());
        ps.setString(9,e.getArrival());
        ps.executeUpdate();

    }

    public List<Booking> getProductsByName(String pName) throws Exception {
        List<Booking> p = new ArrayList<Booking>();
        String sql = "select * from detail where Booking_Name like" + "'%" + pName + "%'";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String name = rs.getString(2);
            String flight_number = rs.getString(3);
            String route = rs.getString(4);
            String date = rs.getString(5);
            int isOpen = rs.getInt(6);
            double fare = rs.getDouble(7);
            String depart = rs.getString(8);
            String arrival = rs.getString(9);
            Booking x = new Booking(id, name, flight_number, route, date, isOpen, fare, depart, arrival);
            p.add(x);

        }
        return p;
    }

    public List<Booking> getBookingById(String ids) throws Exception {
        List<Booking> p = new ArrayList<Booking>();
        String sql = "select * from detail where Booking_ID like" + "'%" + ids + "%'";
        ResultSet rs = getConnection().prepareStatement(sql).executeQuery();
        while (rs.next()) {
            String id = rs.getString(1);
            String name = rs.getString(2);
            String flight_number = rs.getString(3);
            String route = rs.getString(4);
            String date = rs.getString(5);
            int isOpen = rs.getInt(6);
            double fare = rs.getDouble(7);
            String depart = rs.getString(8);
            String arrival = rs.getString(9);
            Booking x = new Booking(id, name, flight_number, route, date, isOpen, fare, depart, arrival);
            p.add(x);

        }
        return p;
    }

    public void updateBooking(String id, String fly_num, String route, int isOpen, double fare,String depart, String arrival) throws Exception {
        String sql = "update detail set flight_number = ? ,route=? ,booking_close = ? ,fare =?, departure = ? , arrival = ? where Booking_ID= ?";
        PreparedStatement ps = getConnection().prepareStatement(sql);

        ps.setString(1, fly_num);
        ps.setString(2,route);
        ps.setInt(3, isOpen);
        ps.setDouble(4, fare);        
        ps.setString(5, depart);
        ps.setString(6, arrival);
        ps.setString(7, id);
        ps.executeUpdate();

    }

    public void deleteBooking(String id) throws Exception {
        String sql = "delete from  detail where Booking_ID= ?";
        PreparedStatement ps = getConnection().prepareStatement(sql);

        ps.setString(1, id);
        ps.executeUpdate();

    }
}
