package com.demo;
import java.sql.Date;

public class Booking {
    private int room_Number;
    private String cName;
    private String email;
    private Date in_Date;
    private Date out_Date;


    public Integer getRoomNumber() {
        return room_Number;
    }

    public void setRoomNumber(Integer roomNumber) {
        this.room_Number = roomNumber;
    }

    public Integer getCustomerName() {
        return cName;
    }

    public void setCustomerName(String customerName) {
        this.cName = customerName;
    }

    public Integer getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCheckInDate() {
        return in_Date;
    }

    public void setCheckInDate(Date checkInDate) {
        this.in_Date = checkInDate;
    }

    public Date getCheckOutDate() {
        return out_Date;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.out_Date = checkOutDate;
    }

       
}
