<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Patients List | OHMS</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans min-h-screen">
<nav class="bg-blue-700 px-4 py-3 flex items-center justify-between">
    <div class="flex items-center space-x-2">
        <span class="text-white text-xl font-bold">Healthcare Management</span>
    </div>
    <div class="hidden md:flex space-x-6">
        <a href="index.jsp" class="text-blue-100 hover:text-white transition">Dashboard</a>
        <a href="patients.jsp" class="text-blue-100 hover:text-white font-bold underline">Patients</a>
        <a href="doctors.jsp" class="text-blue-100 hover:text-white transition">Doctors</a>
        <a href="appointments.jsp" class="text-blue-100 hover:text-white transition">Appointments</a>
        <a href="reports.jsp" class="text-blue-100 hover:text-white transition">Reports</a>
    </div>
</nav>

<main class="container mx-auto px-4 md:px-6 py-8">
    <h1 class="text-2xl font-bold text-blue-700 mb-6">Patients List</h1>

    <div class="bg-white rounded-lg shadow overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200 text-sm">
            <thead class="bg-gray-50">
            <tr>
                <th class="px-6 py-3 text-left font-semibold text-gray-700">ID</th>
                <th class="px-6 py-3 text-left font-semibold text-gray-700">Name</th>
                <th class="px-6 py-3 text-left font-semibold text-gray-700">Age</th>
                <th class="px-6 py-3 text-left font-semibold text-gray-700">Gender</th>
                <th class="px-6 py-3 text-left font-semibold text-gray-700">Last Visit</th>
                <th class="px-6 py-3 text-left font-semibold text-gray-700">Doctor</th>
            </tr>
            </thead>
            <tbody class="bg-white">
            <!-- Use 'patients' attribute; also support 'patientList' as fallback -->
            <c:choose>
                <c:when test="${not empty patients}">
                    <c:forEach var="p" items="${patients}">
                        <tr>
                            <td class="px-6 py-4">${p.id}</td>
                            <td class="px-6 py-4">${p.name}</td>
                            <td class="px-6 py-4">${p.age}</td>
                            <td class="px-6 py-4">${p.gender}</td>
                            <td class="px-6 py-4">${p.lastVisit}</td>
                            <td class="px-6 py-4">${p.doctorName}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:when test="${not empty patientList}">
                    <c:forEach var="p" items="${patientList}">
                        <tr>
                            <td class="px-6 py-4">${p.id}</td>
                            <td class="px-6 py-4">${p.name}</td>
                            <td class="px-6 py-4">${p.age}</td>
                            <td class="px-6 py-4">${p.gender}</td>
                            <td class="px-6 py-4">${p.lastVisit}</td>
                            <td class="px-6 py-4">${p.doctorName}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6" class="px-6 py-4 text-center text-gray-500">No patients found.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
