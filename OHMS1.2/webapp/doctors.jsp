<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userName = (String) session.getAttribute("userFullName");
    if (userName == null) userName = (String) session.getAttribute("userEmail");
    if (userName == null) userName = "Doctor";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Doctor Portal - OHMS</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-50 font-sans text-gray-900">

<div class="min-h-screen flex flex-col md:flex-row">
    <!-- Mobile header -->
    <header class="w-full bg-white border-b shadow-sm flex items-center justify-between px-4 py-3 md:hidden">
        <div class="text-base font-semibold text-teal-600">
            OHMS — Doctor Portal
        </div>
        <button
            class="inline-flex items-center justify-center p-2 rounded-md border text-gray-600 hover:bg-gray-100"
            onclick="toggleSidebar()">
            <span class="text-sm font-medium">Menu</span>
        </button>
    </header>

    <!-- Sidebar -->
    <aside
        id="sidebar"
        class="w-full md:w-64 bg-white border-b md:border-r p-4 md:p-6 shadow-sm hidden md:block">
        <div class="hidden md:block">
            <div class="text-xl font-semibold text-teal-600 mb-4">ES HealthWorks — Doctor Portal</div>
        </div>
        <div class="text-sm text-gray-500">Signed in as</div>
        <div class="mt-1 md:mt-2 font-medium mb-3 md:mb-4 break-words">
            <%= userName %>
        </div>
        <ul class="space-y-2" id="nav">
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg bg-teal-50 text-teal-600 text-sm"
                    onclick="showTab('overview', this)">
                    Dashboard Overview
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('patients', this)">
                    Patient Management
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('schedule', this)">
                    Appointment & Scheduling
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('emr', this)">
                    Electronic Medical Records
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('presc', this)">
                    Prescriptions Management
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('invest', this)">
                    Investigations & Tests
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('comm', this)">
                    Communication
                </button>
            </li>
            <li>
                <button
                    class="nav-btn w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showTab('staff', this)">
                    Staff Utilities
                </button>
            </li>
        </ul>
    </aside>

    <!-- Main content -->
    <main class="flex-1 p-4 md:p-6">
        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-3 mb-4 md:mb-6">
            <div>
                <h2 class="text-xl md:text-2xl font-semibold">Dashboard</h2>
                <div class="text-sm text-gray-500">Overview and quick actions</div>
            </div>
            <div class="w-full md:w-auto">
                <button
                    class="w-full md:w-auto px-4 py-2 rounded bg-teal-600 text-white text-sm">
                    Create Appointment
                </button>
            </div>
        </div>

        <!-- Dashboard overview -->
        <div id="overview" class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="bg-white p-4 rounded shadow">
                <h3 class="font-semibold text-sm md:text-base">Today's Appointments</h3>
                <p class="text-sm text-gray-500">8 scheduled</p>
            </div>
            <div class="bg-white p-4 rounded shadow">
                <h3 class="font-semibold text-sm md:text-base">Pending Messages</h3>
                <p class="text-sm text-gray-500">3 unread</p>
            </div>
            <div class="bg-white p-4 rounded shadow">
                <h3 class="font-semibold text-sm md:text-base">Lab Results</h3>
                <p class="text-sm text-gray-500">2 new</p>
            </div>
        </div>

        <!-- Patient Management -->
        <div id="patients" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Patient Management</h2>
            <p class="text-sm text-gray-500">Search, view and manage patient records.</p>
            <div class="mt-3 flex flex-col sm:flex-row gap-3 items-stretch sm:items-center">
                <input
                    class="w-full sm:w-2/3 p-2 border rounded text-sm"
                    placeholder="Search patients by name or ID">
                <button class="w-full sm:w-auto px-3 py-2 bg-teal-600 text-white rounded text-sm">
                    Search
                </button>
            </div>
            <div class="mt-4 bg-white rounded shadow overflow-x-auto">
                <table class="min-w-full text-xs sm:text-sm">
                    <thead class="text-gray-600">
                        <tr>
                            <th class="p-3 text-left whitespace-nowrap">Name</th>
                            <th class="p-3 text-left whitespace-nowrap">ID</th>
                            <th class="p-3 text-left whitespace-nowrap">Last Visit</th>
                            <th class="p-3 text-left"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-t">
                            <td class="p-3 whitespace-nowrap">Jane Doe</td>
                            <td class="p-3 whitespace-nowrap">P1001</td>
                            <td class="p-3 whitespace-nowrap">2025-12-01</td>
                            <td class="p-3">
                                <button class="px-2 py-1 border rounded text-xs sm:text-sm">
                                    Open
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Appointment & Scheduling -->
        <div id="schedule" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Appointment & Scheduling</h2>
            <p class="text-sm text-gray-500">Manage your calendar and availability.</p>
        </div>

        <!-- EMR -->
        <div id="emr" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Electronic Medical Records (EMR)</h2>
            <p class="text-sm text-gray-500">Access structured patient records and notes.</p>
        </div>

        <!-- Prescriptions -->
        <div id="presc" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Prescriptions Management</h2>
            <p class="text-sm text-gray-500">Create and manage prescriptions, check interactions.</p>
        </div>

        <!-- Investigations -->
        <div id="invest" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Investigations & Tests</h2>
            <p class="text-sm text-gray-500">Order and review lab tests and imaging.</p>
        </div>

        <!-- Communication -->
        <div id="comm" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Communication</h2>
            <p class="text-sm text-gray-500">Secure messaging and teleconsultation links.</p>
        </div>

        <!-- Staff Utilities -->
        <div id="staff" class="mt-6 hidden">
            <h2 class="text-lg font-semibold">Staff Utilities</h2>
            <p class="text-sm text-gray-500">Manage schedules, access control, and announcements.</p>
        </div>
    </main>
</div>

<script>
    function showTab(id, btn) {
        // reset nav styles
        document.querySelectorAll('.nav-btn')
            .forEach(b => b.classList.remove('bg-teal-50', 'text-teal-600'));

        if (btn) btn.classList.add('bg-teal-50', 'text-teal-600');

        // hide all sections
        ['overview', 'patients', 'schedule', 'emr', 'presc', 'invest', 'comm', 'staff']
            .forEach(tid => {
                var el = document.getElementById(tid);
                if (el) el.classList.add('hidden');
            });

        // show selected
        var active = document.getElementById(id);
        if (active) active.classList.remove('hidden');

        // auto-close sidebar on mobile
        if (window.innerWidth < 768) {
            var sb = document.getElementById('sidebar');
            if (sb) sb.classList.add('hidden');
        }
    }

    function toggleSidebar() {
        var sb = document.getElementById('sidebar');
        if (sb) sb.classList.toggle('hidden');
    }

    // Ensure sidebar visible on first load for desktop
    document.addEventListener('DOMContentLoaded', function () {
        if (window.innerWidth >= 768) {
            var sb = document.getElementById('sidebar');
            if (sb) sb.classList.remove('hidden');
        }
    });
</script>
</body>
</html>
