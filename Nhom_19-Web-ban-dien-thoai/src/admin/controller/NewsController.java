package admin.controller;

import MODEL.TinTuc;
import admin.dao.NewsDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/Admin/them-tin-tuc", "/Admin/xoa-tin-tuc", "/Admin/cap-nhat-tin-tuc"})
public class NewsController extends HttpServlet {
    private static final String TABLE = "tintuc";
    private static final String PRIMARY_K = "id";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        try {
            if (action.equals("xoa")) {
                if (NewsDAO.remove(Integer.parseInt(id))) {
                    request.getServletContext().setAttribute("dia-log", "sucXóa thành công");
                    response.sendRedirect("news-manage.jsp");
                }
            } else if (action.equals("sua")) {
                TinTuc tinTuc = NewsDAO.findByID(Integer.parseInt(id));
                request.setAttribute("tintuc", tinTuc);
                request.getRequestDispatcher("news-update.jsp").forward(request, response);
            }

        } catch (SQLException | ServletException e) {
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = "";
        int id;
        String loai = "";

        String image = "";
        String change_img = "";
//        String before_path = "";
        String path = "";
        FileItem ite = null;

        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            TinTuc tinTuc = new TinTuc();
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
                List<FileItem> fieldList = servletFileUpload.parseRequest(request);
                for (FileItem item : fieldList) {
                    switch (item.getFieldName()) {
                        case "action":
                            action = item.getString();
                            break;
                        case "id":
                            id = Integer.parseInt(item.getString());
                            tinTuc.setMaTinTuc(id);
                            break;
                        case "title":
                            tinTuc.setTieuDe(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "description":
                            tinTuc.setMoTa(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                        case "type":
                            tinTuc.setLoai(Integer.parseInt(item.getString()));
                            if (Integer.parseInt(item.getString()) == 0) {
                                loai = "news-new";
                            } else {
                                loai = "news-sale";
                            }
                            break;
                        case "change-img":
                            change_img = item.getString();
                            break;
                        case "link-img":
                            image = new File(item.getName()).getName();
                            if (!image.equals("")) {
//                                before_path = "D:/Intellij-WEB/Nhom19_Web-ban-dien-thoai/web/";
                                path = "assets/img/news/" + loai.toLowerCase() + "/" + image;
                                ite = item;
                                tinTuc.setAnhMoTa(path);
                            } else {
                                tinTuc.setAnhMoTa(change_img);
                            }
                            break;
                        case "date-post":
                            tinTuc.setNgayViet(item.getString());
                            break;
                        case "content":
                            tinTuc.setNoiDung(new String(item.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                            break;
                    }
                }
            }
            if (action.equals("them")) {
                if (new NewsDAO().add(tinTuc)) {
                    File save = new File(request.getRealPath("/") + path);
                    if (!save.exists()) {
                        if (ite != null)
                            ite.write(save);
                    }
                    request.getServletContext().setAttribute("dia-log", "sucThêm thành công");
                    response.sendRedirect("news-manage.jsp");
                }
            } else if (action.equals("xulysua")) {
                if (new NewsDAO().edit(tinTuc)) {
                    if (!image.equals("")) {
                        File save = new File(request.getRealPath("/")+ path);
                        if (!save.exists()) {
                            if (ite != null)
                                ite.write(save);
                        }
                    }
                    request.getServletContext().setAttribute("dia-log", "sucSửa thành công");
                    response.sendRedirect("news-manage.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

