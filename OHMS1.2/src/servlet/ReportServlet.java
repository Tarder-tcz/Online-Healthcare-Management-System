package servlet;

import dao.ReportDAO;
import model.Report;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Report> reports = new ReportDAO().getAllReports();
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("reports.jsp").forward(request, response);
    }
}
