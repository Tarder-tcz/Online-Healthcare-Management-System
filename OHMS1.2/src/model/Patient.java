package model;

public class Patient {
    private int id;
    private String name;
    private int age;
    private String gender;
    private String lastVisit;
    private String doctorName;

    public Patient(int id, String name, int age, String gender, String lastVisit, String doctorName) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.lastVisit = lastVisit;
        this.doctorName = doctorName;
    }
    public int getId() { return id; }
    public String getName() { return name; }
    public int getAge() { return age; }
    public String getGender() { return gender; }
    public String getLastVisit() { return lastVisit; }
    public String getDoctorName() { return doctorName; }
}
