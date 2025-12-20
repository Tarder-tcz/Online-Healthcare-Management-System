package dao;

import model.Appointment;
import java.util.*;

public class AppointmentDAO {
    public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        appointments.add(new Appointment(1, "2025-11-25", "09:00 AM", "John Doe", "Dr. Alice Smith", "Confirmed"));
        appointments.add(new Appointment(2, "2025-11-26", "11:30 AM", "Jane Smith", "Dr. Bob Lee", "Pending"));
        // Add more dummy appointments as needed
        return appointments;
    }
}
