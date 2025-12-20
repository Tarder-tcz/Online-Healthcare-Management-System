package model;

public class Doctor {
    private int id;
    private String name;
    private String specialization;
    private String phone;
    private String email;
    private String status;

    public Doctor(int id, String name, String specialization, String phone, String email, String status) {
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }
    public int getId() { return id; }
    public String getName() { return name; }
    public String getSpecialization() { return specialization; }
    public String getPhone() { return phone; }
    public String getEmail() { return email; }
    public String getStatus() { return status; }
}
