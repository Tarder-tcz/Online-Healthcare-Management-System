package model;

public class Appointment {
    private int id;
    private String date;
    private String time;
    private String patientName;
    private String doctorName;
    private String status;

    public Appointment(int id, String date, String time, String patientName, String doctorName, String status) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.status = status;
    }
    public int getId() { return id; }
    public String getDate() { return date; }
    public String getTime() { return time; }
    public String getPatientName() { return patientName; }
    public String getDoctorName() { return doctorName; }
    public String getStatus() { return status; }
}
