package website.controller;

import MODEL.SanPham;
import MODEL.ThanhVien;
import Utils.SessionUtil;
import website.dao.ProductDAO;
import website.model.GioHang;
import website.model.Item;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/xu-ly-gio-hang")
public class CartController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int soluong = 1;
        String update = request.getParameter("update");
//        ThanhVien thanhVien = (ThanhVien) SessionUtil.getInstance().getValue(request, "USER");
        String msp;
        if (request.getParameter("id") != null) {
            msp = request.getParameter("id");
            SanPham sp = null;
            try {
                sp = ProductDAO.getProductID(Integer.parseInt(msp.trim()));
            } catch (ClassNotFoundException |NumberFormatException e) {
                e.printStackTrace();
            }
            if (sp != null) {
                GioHang gh = (GioHang) SessionUtil.getInstance().getValue(request, "giohang");
                if (request.getParameter("soluong") != null) {
                    soluong = Integer.parseInt(request.getParameter("soluong"));
                    if (soluong < 1) soluong = 1;
                    if (gh == null) {
                        gh = new GioHang();
//                        gh.setThanhVien(thanhVien);
                        gh.setTrangthai(1);
//                        gh.setId(thanhVien.getTaiKhoan());
                        List<Item> items = new ArrayList<>();
                        Item item = new Item();
                        item.setGia(sp.getGiaDaGiam());
                        item.setSanPham(sp);
                        item.setSoLuong(soluong);
                        item.setId(msp);
                        items.add(item);
                        gh.setItem(items);
                    } else {
                        List<Item> items = gh.getItem();
                        boolean check = false;
                        for (Item i : items) {
                            if (i.getSanPham().getMaSanPham()==sp.getMaSanPham()) {
                                if (soluong == 1 && update == null) {
                                    i.setSoLuong(i.getSoLuong() + soluong);
                                } else {
                                    i.setSoLuong(soluong);
                                }
                                check = true;
                            }
                        }
                        if (!check) {
                            Item item = new Item();
                            item.setGia(sp.getGiaDaGiam());
                            item.setSanPham(sp);
                            item.setSoLuong(soluong);
                            item.setId(msp);
                            items.add(item);
                        }
                    }
                } else { //xoa 1 item ra gio hang
                    List<Item> items = gh.getItem();
                    for (Item item : items) {
                        if (item.getSanPham().getMaSanPham()==sp.getMaSanPham()) {
                            items.remove(item);
                            break;
                        }
                    }
                }
                SessionUtil.getInstance().putValue(request, "giohang", gh);
                GioHang gh_respone = (GioHang) SessionUtil.getInstance().getValue(request, "giohang");
                response.getWriter().print((gh_respone.totalCount() + "-" + String.format("%,.0f", gh_respone.totalPrice()) + "đ"));
//                String follow = request.getParameter("cm");
//                String type = request.getParameter("type");
//                response.sendRedirect(Util.fullPath(type==null?follow:follow+"&type="+type));
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}
