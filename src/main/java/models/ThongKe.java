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
public class ThongKe {
    

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author MSI GV62
 */

    public static int SoLuong;
    public static int DaTraLoi;
    public static int ChuaTraLoi;
    public static int CacLoai;
    public static int DaPhanLoai;   
    public static int ChuaPhanLoai;
    
    public ThongKe(int SoLuong, int DaTraLoi,int ChuaTraLoi, int CacLoai,int DaPhanLoai,int ChuaPhanLoai){
        this.SoLuong = SoLuong;
        this.DaTraLoi = DaTraLoi;
        this.ChuaTraLoi = ChuaTraLoi;
        this.CacLoai = CacLoai;
        this.DaPhanLoai = DaPhanLoai;
        this.ChuaPhanLoai = ChuaPhanLoai;
    }
    
    public ThongKe(){
    }
    
    public int getSoLuong(){
        return SoLuong;
    }
    
    public void setSoLuong(int SoLuong){
        this.SoLuong = SoLuong;
    }
    
    public int getDaTraLoi(){
        return DaTraLoi;
    }
    
    public void setDaTraLoi(int DaTraLoi){
        this.DaTraLoi = DaTraLoi;
    }
    
    public int getChuaTraLoi(){
        return ChuaTraLoi;
    }
    
    public void setChuaTraLoi(int ChuaTraLoi){
        this.ChuaTraLoi = ChuaTraLoi;
    }
    
    public int getCacLoai(){
        return CacLoai;
    }
    
    public void setCacLoai(int CacLoai){
        this.CacLoai = CacLoai;
    }
    
    public int getDaPhanLoai(){
        return DaPhanLoai;
    }
    
    public void setDaPhanLoai(int DaPhanLoai){
        this.DaPhanLoai = DaPhanLoai;
    }
    
    public int getChuaPhanLoai(){
        return ChuaPhanLoai;
    }
    
    public void setChuaPhanLoai(int ChuaPhanLoai){
        this.ChuaPhanLoai = ChuaPhanLoai;
    }
}
