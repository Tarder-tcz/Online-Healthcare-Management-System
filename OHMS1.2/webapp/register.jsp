<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Register - OHMS</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans min-h-screen flex items-center justify-center">
  <div class="w-full max-w-md bg-white rounded-lg shadow p-6">
    <h1 class="text-2xl font-bold mb-4">Create an account</h1>

    <% String regErr = (String) request.getAttribute("registerError"); %>
    <% if (regErr != null) { %>
      <div class="text-red-700 bg-red-100 p-2 rounded mb-3"><%= regErr %></div>
    <% } %>

    <% String registered = request.getParameter("registered"); %>
    <% if ("1".equals(registered)) { %>
      <div class="text-green-700 bg-green-100 p-2 rounded mb-3">Registration successful. Please sign in.</div>
    <% } %>

    <form action="<%= request.getContextPath() %>/auth" method="post" class="space-y-3">
      <input type="hidden" name="action" value="register" />

      <div>
        <label for="fullName">Full name</label>
        <input id="fullName" name="fullName" type="text" required class="w-full border rounded px-3 py-2" />
      </div>

      <div>
        <label for="email">Email</label>
        <input id="email" name="email" type="email" required class="w-full border rounded px-3 py-2" />
      </div>

      <div>
        <label for="password">Password</label>
        <input id="password" name="password" type="password" required class="w-full border rounded px-3 py-2" />
      </div>

      <div>
        <label for="role">Register as</label>
        <select id="role" name="role" required class="w-full border rounded px-3 py-2">
          <option value="PATIENT">Patient</option>
          <option value="STAFF">Staff</option>
        </select>
      </div>

      <div class="pt-2">
        <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded">Sign up</button>
      </div>
    </form>

    <p class="mt-4 text-sm">Already have an account? <a href="<%= request.getContextPath() %>/webapp/login.jsp" class="text-blue-600 underline">Sign in here</a></p>
  </div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>

