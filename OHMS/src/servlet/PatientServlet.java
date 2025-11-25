package servlet;

import dao.PatientDAO;
import model.Patient;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PatientServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Patient> patients = new PatientDAO().getAllPatients();
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("patients.jsp").forward(request, response);
    }
}
