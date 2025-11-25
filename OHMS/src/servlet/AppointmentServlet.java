package servlet;

import dao.AppointmentDAO;
import model.Appointment;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AppointmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Appointment> appointments = new AppointmentDAO().getAllAppointments();
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("appointments.jsp").forward(request, response);
    }
}
