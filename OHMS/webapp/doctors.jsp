<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,model.Doctor" %>
<%
    List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Doctors List | OHMS</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans min-h-screen">
<%@ include file="navbar.jsp" %>
<main class="container mx-auto px-4 md:px-6 py-8">
    <div class="flex flex-col sm:flex-row items-center justify-between mb-6">
      <h1 class="text-2xl font-bold text-green-700 mb-2 sm:mb-0">Doctors List</h1>
      <form method="get" action="DoctorServlet">
        <input name="search" placeholder="Search doctors..." class="border rounded px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-400" />
      </form>
    </div>
    <div class="bg-white rounded-lg shadow overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200 text-sm">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-6 py-3 text-left font-semibold text-gray-700">ID</th>
            <th class="px-6 py-3 text-left font-semibold text-gray-700">Name</th>
            <th class="px-6 py-3 text-left font-semibold text-gray-700">Specialization</th>
            <th class="px-6 py-3 text-left font-semibold text-gray-700">Phone</th>
            <th class="px-6 py-3 text-left font-semibold text-gray-700">Email</th>
            <th class="px-6 py-3 text-left font-semibold text-gray-700">Status</th>
          </tr>
        </thead>
        <tbody class="bg-white">
          <% if (doctors != null) { 
                 for (Doctor d : doctors) { %>
          <tr>
            <td class="px-6 py-4"><%= d.getId() %></td>
            <td class="px-6 py-4"><%= d.getName() %></td>
            <td class="px-6 py-4"><%= d.getSpecialization() %></td>
            <td class="px-6 py-4"><%= d.getPhone() %></td>
            <td class="px-6 py-4"><%= d.getEmail() %></td>
            <td class="px-6 py-4"><%= d.getStatus() %></td>
          </tr>
          <%     }
               } %>
        </tbody>
      </table>
    </div>
</main>
</body>
</html>
