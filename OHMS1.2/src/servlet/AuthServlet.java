package servlet;

import dao.UserDAO;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("login".equals(action)) {
            handleLogin(req, resp);
        } else if ("register".equals(action)) {
            handleRegister(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action");
        }
    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        if (email == null || password == null || role == null) {
            resp.sendRedirect(req.getContextPath() + "/webapp/login.jsp");
            return;
        }

        try {
            String hash = hashPassword(password);
            if (UserDAO.authenticate(email, hash, role)) {
                HttpSession session = req.getSession(true);
                session.setAttribute("userEmail", email);
                session.setAttribute("role", role);
                if ("PATIENT".equals(role)) {
                    resp.sendRedirect(req.getContextPath() + "/webapp/patients.jsp");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/webapp/doctors.jsp");
                }
            } else {
                req.setAttribute("loginError", "Invalid email or password");
                req.getRequestDispatcher("/webapp/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String fullName = req.getParameter("fullName");

        if (email == null || password == null || role == null) {
            req.setAttribute("registerError", "Missing required fields");
            req.getRequestDispatcher("/webapp/register.jsp").forward(req, resp);
            return;
        }

        try {
            String hash = hashPassword(password);
            boolean created = UserDAO.createUser(email, hash, role, fullName);
            if (created) {
                resp.sendRedirect(req.getContextPath() + "/webapp/login.jsp?registered=1");
            } else {
                req.setAttribute("registerError", "User already exists");
                req.getRequestDispatcher("/webapp/register.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private static String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] digest = md.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
