<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Login - OHMS</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans min-h-screen flex items-center justify-center">
  <div class="w-full max-w-md bg-white rounded-lg shadow p-6">
    <h1 class="text-2xl font-bold mb-4">Sign in</h1>

    <% String loginErr = (String) request.getAttribute("loginError"); %>
    <% if (loginErr != null) { %>
      <div class="text-red-700 bg-red-100 p-2 rounded mb-3"><%= loginErr %></div>
    <% } %>

    <% String registered = request.getParameter("registered"); %>
    <% if ("1".equals(registered)) { %>
      <div class="text-green-700 bg-green-100 p-2 rounded mb-3">Registration successful. Please sign in.</div>
    <% } %>

    <% String preRole = request.getParameter("role"); %>

    <form action="<%= request.getContextPath() %>/auth" method="post" class="space-y-3">
      <input type="hidden" name="action" value="login" />

      <div>
        <label for="email">Email</label>
        <input id="email" name="email" type="email" required class="w-full border rounded px-3 py-2" />
      </div>

      <div>
        <label for="password">Password</label>
        <input id="password" name="password" type="password" required class="w-full border rounded px-3 py-2" />
      </div>

      <div>
        <label for="role">Login as</label>
        <select id="role" name="role" required class="w-full border rounded px-3 py-2">
          <option value="PATIENT" <%= "PATIENT".equals(preRole) ? "selected" : "" %>>Patient</option>
          <option value="STAFF" <%= "STAFF".equals(preRole) ? "selected" : "" %>>Staff</option>
        </select>
      </div>

      <div class="pt-2">
        <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded">Sign in</button>
      </div>
    </form>

    <p class="mt-4 text-sm">New here? <a href="<%= request.getContextPath() %>/webapp/register.jsp" class="text-blue-600 underline">Create an account</a></p>
  </div>
</body>
</html>
