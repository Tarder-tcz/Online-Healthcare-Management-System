package dao;

import model.Doctor;
import java.util.*;

public class DoctorDAO {
    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        doctors.add(new Doctor(1, "Dr. Alice Smith", "Cardiology", "123-456-7890", "alice.smith@example.com", "Available"));
        doctors.add(new Doctor(2, "Dr. Bob Lee", "Orthopedics", "987-654-3210", "bob.lee@example.com", "On Leave"));
        // Add more dummy doctors as needed
        return doctors;
    }
}
