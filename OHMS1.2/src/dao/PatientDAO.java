package dao;

import model.Patient;
import java.util.*;

public class PatientDAO {
    public List<Patient> getAllPatients() {
        List<Patient> patients = new ArrayList<>();
        patients.add(new Patient(1, "John Doe", 35, "Male", "2025-11-10", "Dr. Smith"));
        patients.add(new Patient(2, "Jane Smith", 28, "Female", "2025-11-12", "Dr. Lee"));
        return patients;
    }
}
