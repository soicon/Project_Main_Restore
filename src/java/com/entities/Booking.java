/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

/**
 *
 * @author dung nguyen
 */
public class Booking {
    private String id;
    private String cus_name;
    private String flight_number;
    private String route;
    private String date;   
    private int isOpen;
    private double fare;
    private String departure;
    private String arrival;

    public Booking(String id, String cus_name, String flight_number, String route, String date, int isOpen, double fare, String departure, String arrival) {
        this.id = id;
        this.cus_name = cus_name;
        this.flight_number = flight_number;
        this.route = route;
        this.date = date;
        this.isOpen = isOpen;
        this.fare = fare;
        this.departure = departure;
        this.arrival = arrival;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public int getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(int isOpen) {
        this.isOpen = isOpen;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }

  
    
}
