/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author VietAnh
 */
public class PhanHoi {
    

    private int id;
    private String noiDung;

    public PhanHoi() {
    }

    public PhanHoi(int id, String noiDung) {
        this.id = id;
        this.noiDung = noiDung;
    }
    
    public int getId() {
        return id;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }
    
    
}