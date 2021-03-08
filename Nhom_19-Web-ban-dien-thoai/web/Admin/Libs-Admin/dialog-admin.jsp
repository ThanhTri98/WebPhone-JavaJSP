<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%String dia_log = (String) request.getServletContext().getAttribute("dia-log");
%>
<%if(dia_log!=null){%>
<%if(dia_log.substring(0,3).equalsIgnoreCase("suc")){%>
<span class="dia-log" style="border: 1px solid #4fc38b;color: #0a6966;background: rgba(12,183,166,0.11)"><%=dia_log.substring(3)%></span>
<%}else if(dia_log.substring(0,3).equalsIgnoreCase("err")){%>
<span class="dia-log" style="border: 1px solid #b50000;color: #e30000;background: rgba(207,0,0,0.11)"><%=dia_log.substring(3)%></span>
<%}}%>
<%request.getServletContext().removeAttribute("dia-log");%>