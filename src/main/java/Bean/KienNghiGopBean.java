/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.List;
import models.KienNghi;
import models.KienNghiGop;

/**
 *
 * @author Acer
 */
public class KienNghiGopBean {
    private KienNghiGop kienNghiGop;
    private List<KienNghi> thanhPhanGop;

    public KienNghiGopBean(KienNghiGop kienNghiGop, List<KienNghi> thanhPhanGop) {
        this.kienNghiGop = kienNghiGop;
        this.thanhPhanGop = thanhPhanGop;
    }

    public KienNghiGop getKienNghiGop() {
        return kienNghiGop;
    }

    public void setKienNghiGop(KienNghiGop kienNghiGop) {
        this.kienNghiGop = kienNghiGop;
    }

    public List<KienNghi> getThanhPhanGop() {
        return thanhPhanGop;
    }

    public void setThanhPhanGop(List<KienNghi> thanhPhanGop) {
        this.thanhPhanGop = thanhPhanGop;
    }
    
    
}
        
