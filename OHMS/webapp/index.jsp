<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Healthcare Management System</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans min-h-screen">
  <!-- Navbar -->
  <nav class="bg-blue-700 px-4 py-3 flex items-center justify-between">
    <div class="flex items-center space-x-2">
      <svg class="w-8 h-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path d="M12 6v6l4 2"/>
      </svg>
      <span class="text-white text-xl font-bold">Healthcare Management</span>
    </div>
    <div class="hidden md:flex space-x-6">
      <a href="index.jsp" class="text-blue-100 hover:text-white font-bold underline transition">Dashboard</a>
      <a href="patients.jsp" class="text-blue-100 hover:text-white transition">Patients</a>
      <a href="doctors.jsp" class="text-blue-100 hover:text-white transition">Doctors</a>
      <a href="appointments.jsp" class="text-blue-100 hover:text-white transition">Appointments</a>
      <a href="reports.jsp" class="text-blue-100 hover:text-white transition">Reports</a>
    </div>
  </nav>

  <!-- Hero -->
  <header class="bg-blue-600 text-white py-12 shadow-lg">
    <div class="container mx-auto px-6">
      <h1 class="text-4xl font-extrabold mb-2">Welcome to the Online Healthcare Management System</h1>
      <p class="text-lg">Efficient and secure healthcare workflows for hospitals, clinics, doctors, and patients.</p>
    </div>
  </header>

  <!-- Dashboard Cards -->
  <main class="container mx-auto px-6 py-10">
    <div class="grid gap-6 md:grid-cols-4 mt-6">
      <a href="patients.jsp" class="bg-white rounded-lg shadow px-6 py-5 flex flex-col items-start hover:shadow-lg transition">
        <div class="p-3 rounded-full bg-blue-100 text-blue-600 mb-2">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path d="M16 7a4 4 0 10-8 0 4 4 0 008 0z"/><path d="M12 14a7 7 0 00-7 7"/>
          </svg>
        </div>
        <h2 class="text-lg font-semibold">Patients</h2>
        <p class="text-gray-500 text-sm">Manage patient records and history</p>
      </a>
      <a href="doctors.jsp" class="bg-white rounded-lg shadow px-6 py-5 flex flex-col items-start hover:shadow-lg transition">
        <div class="p-3 rounded-full bg-green-100 text-green-600 mb-2">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path d="M18 8a6 6 0 11-12 0 6 6 0 0112 0z"/><path d="M12 14a7 7 0 00-7 7"/>
          </svg>
        </div>
        <h2 class="text-lg font-semibold">Doctors</h2>
        <p class="text-gray-500 text-sm">View and update doctor profiles</p>
      </a>
      <a href="appointments.jsp" class="bg-white rounded-lg shadow px-6 py-5 flex flex-col items-start hover:shadow-lg transition">
        <div class="p-3 rounded-full bg-yellow-100 text-yellow-600 mb-2">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path d="M8 7V3m8 4V3m-9 8h10m2 8a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h14a2 2 0 012 2z"/>
          </svg>
        </div>
        <h2 class="text-lg font-semibold">Appointments</h2>
        <p class="text-gray-500 text-sm">Book and track appointments</p>
      </a>
      <a href="reports.jsp" class="bg-white rounded-lg shadow px-6 py-5 flex flex-col items-start hover:shadow-lg transition">
        <div class="p-3 rounded-full bg-purple-100 text-purple-600 mb-2">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path d="M9 17v-2a4 4 0 018 0v2m-8 0v2h8v-2"/>
          </svg>
        </div>
        <h2 class="text-lg font-semibold">Reports</h2>
        <p class="text-gray-500 text-sm">Access patient and billing reports</p>
      </a>
    </div>

    <!-- Features Section -->
    <div class="mt-10 bg-white rounded-lg shadow px-8 py-6">
      <h3 class="text-2xl font-bold mb-2 text-blue-700">Why our Healthcare Management System?</h3>
      <ul class="text-gray-700 list-disc list-inside space-y-1">
        <li>Centralized and secure patient information management</li>
        <li>Fast appointment scheduling and reminders</li>
        <li>Intuitive interface for doctors, staff, and patients</li>
        <li>Role-based secure logins with audit trails</li>
        <li>Real-time access to records and analytics</li>
      </ul>
    </div>
  </main>
  <!-- Footer -->
  <footer class="bg-blue-700 text-blue-100 text-center py-4 mt-10">
    &copy; 2025 Online Healthcare Management System
  </footer>
</body>
</html>
