package model;

public class Report {
    private int id;
    private String date;
    private String patientName;
    private String doctorName;
    private String type;
    private String status;

    public Report(int id, String date, String patientName, String doctorName, String type, String status) {
        this.id = id;
        this.date = date;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.type = type;
        this.status = status;
    }
    public int getId() { return id; }
    public String getDate() { return date; }
    public String getPatientName() { return patientName; }
    public String getDoctorName() { return doctorName; }
    public String getType() { return type; }
    public String getStatus() { return status; }
}
