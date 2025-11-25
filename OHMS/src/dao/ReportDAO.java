package dao;

import model.Report;
import java.util.*;

public class ReportDAO {
    public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();
        reports.add(new Report(1, "2025-11-10", "John Doe", "Dr. Alice Smith", "Lab", "Complete"));
        reports.add(new Report(2, "2025-11-12", "Jane Smith", "Dr. Bob Lee", "Billing", "Pending"));
        // Add more dummy reports as needed
        return reports;
    }
}
