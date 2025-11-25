package servlet;

import dao.DoctorDAO;
import model.Doctor;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DoctorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Doctor> doctors = new DoctorDAO().getAllDoctors();
        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("doctors.jsp").forward(request, response);
    }
}
