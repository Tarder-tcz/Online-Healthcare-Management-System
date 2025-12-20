# OHMS — Online Healthcare Management System (v1)

This repository is a simple Java/JSP web application implementing a basic Online Healthcare Management System (OHMS). It includes patient and staff/doctor portals, registration and login backed by an embedded H2 database, and responsive UI pages using Tailwind CSS (via CDN).

## Key Features

- User registration and login (patients and staff) using `AuthServlet` and `UserDAO` backed by H2.
- Persistent user storage (H2 embedded DB) via `dao/DBConnection.java` and `dao/UserDAO.java`.
- Patient portal (`webapp/patients.jsp`) with:
  - Upcoming appointments
  - Medical records / reports
  - Prescriptions & medications
  - Billing & payments
  - Health profile
  - Secure messaging / support
  - Notifications panel
  - Emergency / quick actions
- Doctor portal (`webapp/doctor.jsp` / `webapp/doctors.jsp`) with:
  - Dashboard overview
  - Patient management
  - Appointment & scheduling
  - Electronic Medical Records (EMR)
  - Prescriptions management
  - Investigations & tests
  - Communication
  - Staff utilities
- Modern responsive layout built with Tailwind CSS (CDN) and mobile-friendly sidebar/menu patterns.
- Simple build helper scripts to compile Java classes into `WEB-INF/classes` (project root `build.bat` / `build.ps1` if present).

## Project Layout (important files)

- `src/dao/` — database connection and DAOs (e.g., `DBConnection.java`, `UserDAO.java`).
- `src/servlet/` — servlets handling requests (e.g., `AuthServlet.java`).
- `webapp/` — JSP front-end pages (e.g., `index.jsp`, `login.jsp`, `register.jsp`, `patients.jsp`, `doctors.jsp`).
- `WEB-INF/web.xml` — servlet mapping and webapp configuration.
- `WEB-INF/lib/` — third-party libraries required at runtime (Tomcat provides servlet API; add H2 JDBC jar here).

## Local Run / Deploy (Tomcat)

1. Copy the H2 JDBC driver (e.g., `h2-*.jar`) into the webapp `WEB-INF/lib` directory so the app can load `org.h2.Driver` at runtime. Example PowerShell (run from project root):

```powershell
New-Item -ItemType Directory -Path .\WEB-INF\lib -ErrorAction SilentlyContinue
Copy-Item .\lib\H2\h2*.jar -Destination .\WEB-INF\lib -Force
```

2. If you compiled sources locally, ensure compiled classes are placed under `WEB-INF/classes` matching package layout.

3. Restart Tomcat and open the app at:

   http://localhost:8080/YourAppName/ (replace `YourAppName` with the deployed context — e.g., `OHMS1.2`)

4. Use the site pages:
   - `index.jsp` — home
   - `login.jsp` — login (supports `?role=STAFF` to preselect staff)
   - `register.jsp` — registration
   - `webapp/patients.jsp` and `webapp/doctors.jsp` — portals
