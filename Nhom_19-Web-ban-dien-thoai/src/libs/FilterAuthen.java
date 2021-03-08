package libs;

import MODEL.ThanhVien;
import Utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FilterAuthen implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext servletContext = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        ThanhVien thanhVien = (ThanhVien) SessionUtil.getInstance().getValue(request, "USER");
            if (thanhVien != null && thanhVien.getLevel() == 1) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                response.sendRedirect(Util.fullPath("AD/dang-nhap"));
            }
    }
    @Override
    public void destroy() {

    }
}
