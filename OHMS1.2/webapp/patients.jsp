<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userName = (String) session.getAttribute("userFullName");
    if (userName == null) userName = (String) session.getAttribute("userEmail");
    if (userName == null) userName = "Guest";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Patient Portal - OHMS</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-50 font-sans text-gray-900">
<div class="min-h-screen flex flex-col md:flex-row">
    <!-- Top bar for mobile -->
    <header class="w-full bg-white border-b shadow-sm flex items-center justify-between px-4 py-3 md:hidden">
        <div class="text-base font-semibold text-indigo-600">OHMS — Patient Portal</div>
        <button
            class="inline-flex items-center justify-center p-2 rounded-md border text-gray-600 hover:bg-gray-100"
            onclick="toggleSidebar()">
            <span class="text-sm font-medium">Menu</span>
        </button>
    </header>

    <!-- Sidebar -->
    <aside
        id="sidebar"
        class="w-full md:w-64 bg-white border-b md:border-r shadow-sm p-4 md:p-6 md:block hidden md:block">
        <div class="hidden md:block">
            <div class="text-xl font-semibold text-indigo-600 mb-4">ES HealthWorks — Patient Portal</div>
        </div>
        <div class="text-sm text-gray-500">Signed in as</div>
        <div class="mt-1 md:mt-2 font-medium mb-3 md:mb-4 break-words">
            <%= userName %>
        </div>
        <ul class="space-y-2" id="nav">
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg bg-indigo-50 text-indigo-600 text-sm"
                    onclick="showPanel('upcoming', this)">
                    Upcoming Appointments
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('records', this)">
                    Medical Records
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('prescriptions', this)">
                    Prescriptions & Meds
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('billing', this)">
                    Billing & Payments
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('profile', this)">
                    Health Profile
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('messaging', this)">
                    Secure Messaging
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('notifications', this)">
                    Notifications
                </button>
            </li>
            <li>
                <button
                    class="w-full text-left px-3 py-2 rounded-lg hover:bg-gray-100 text-sm"
                    onclick="showPanel('emergency', this)">
                    Emergency / Quick Actions
                </button>
            </li>
        </ul>
    </aside>

    <!-- Main content -->
    <main class="flex-1 p-4 md:p-6">
        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-3 mb-4 md:mb-6">
            <div class="flex items-center gap-3">
                <div class="px-3 py-2 bg-white border rounded-lg text-sm md:text-base">
                    Welcome, <strong><%= userName %></strong>
                </div>
            </div>
            <div class="w-full md:w-auto">
                <button
                    class="w-full md:w-auto bg-indigo-600 text-white px-4 py-2 rounded-lg text-sm">
                    Schedule Appointment
                </button>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-4 md:gap-6">
            <section class="lg:col-span-2 space-y-4">
                <!-- Upcoming -->
                <div id="upcoming" class="bg-white p-4 rounded-lg shadow">
                    <h2 class="text-lg font-semibold mb-1">Upcoming Appointments</h2>
                    <p class="text-sm text-gray-500">You have 2 upcoming appointments.</p>
                    <div class="mt-4 overflow-x-auto">
                        <table class="min-w-full text-xs sm:text-sm text-left">
                            <thead class="text-gray-600">
                                <tr>
                                    <th class="py-2 pr-4">Date</th>
                                    <th class="py-2 pr-4">Doctor</th>
                                    <th class="py-2 pr-4">Type</th>
                                    <th class="py-2"></th>
                                </tr>
                            </thead>
                            <tbody class="text-gray-800">
                                <tr class="border-t">
                                    <td class="py-2 pr-4 whitespace-nowrap text-xs sm:text-sm">
                                        2025-12-30 10:30
                                    </td>
                                    <td class="py-2 pr-4">Dr. Ada N.</td>
                                    <td class="py-2 pr-4">Consultation</td>
                                    <td class="py-2">
                                        <button class="text-xs sm:text-sm px-2 py-1 bg-gray-100 rounded">
                                            Details
                                        </button>
                                    </td>
                                </tr>
                                <tr class="border-t">
                                    <td class="py-2 pr-4 whitespace-nowrap text-xs sm:text-sm">
                                        2026-01-05 14:00
                                    </td>
                                    <td class="py-2 pr-4">Dr. John S.</td>
                                    <td class="py-2 pr-4">Follow-up</td>
                                    <td class="py-2">
                                        <button class="text-xs sm:text-sm px-2 py-1 bg-gray-100 rounded">
                                            Reschedule
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Records -->
                <div id="records" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Medical Records & Reports</h2>
                    <p class="text-sm text-gray-500">Download your latest lab reports and visit summaries.</p>
                    <ul class="mt-3 space-y-2 text-sm">
                        <li class="flex justify-between gap-2">
                            <span>Blood Test</span>
                            <a class="text-indigo-600" href="#">Download</a>
                        </li>
                        <li class="flex justify-between gap-2">
                            <span>X-ray Report</span>
                            <a class="text-indigo-600" href="#">Download</a>
                        </li>
                    </ul>
                </div>

                <!-- Prescriptions -->
                <div id="prescriptions" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Prescriptions & Medications</h2>
                    <p class="text-sm text-gray-500">Active prescriptions and refill options.</p>
                    <ul class="mt-3 space-y-2 text-gray-800 text-sm">
                        <li>
                            Atorvastatin 10mg —
                            <span class="text-xs text-gray-500">Refill in 4 days</span>
                        </li>
                        <li>
                            Amoxicillin 500mg —
                            <span class="text-xs text-gray-500">Completed</span>
                        </li>
                    </ul>
                </div>

                <!-- Billing -->
                <div id="billing" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Billing & Payments</h2>
                    <p class="text-sm text-gray-500">Outstanding invoices and payment methods.</p>
                    <div class="mt-3 text-sm">
                        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between py-2 border-t gap-2">
                            <div>Invoice #1001</div>
                            <div>
                                $120.00
                                <button class="mt-1 sm:mt-0 ml-0 sm:ml-2 px-2 py-1 bg-indigo-600 text-white rounded text-xs">
                                    Pay
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Profile -->
                <div id="profile" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Health Profile</h2>
                    <p class="text-sm text-gray-500">Manage allergies, chronic conditions, and emergency contacts.</p>
                    <p class="mt-2 text-sm">
                        <strong>Allergies:</strong> Penicillin
                    </p>
                </div>

                <!-- Messaging -->
                <div id="messaging" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Secure Messaging / Support</h2>
                    <p class="text-sm text-gray-500">Send a secure message to your care team.</p>
                    <textarea
                        class="w-full mt-3 p-2 border rounded h-24 text-sm"
                        placeholder="Write a message..."></textarea>
                    <div class="mt-3">
                        <button class="px-3 py-1 bg-indigo-600 text-white rounded text-sm">Send</button>
                    </div>
                </div>

                <!-- Notifications -->
                <div id="notifications" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Notifications</h2>
                    <ul class="mt-2 text-sm text-gray-600 space-y-1">
                        <li>
                            New lab result available —
                            <span class="text-gray-400">1 hour ago</span>
                        </li>
                        <li>
                            Appointment reminder —
                            <span class="text-gray-400">2 days</span>
                        </li>
                    </ul>
                </div>

                <!-- Emergency -->
                <div id="emergency" class="bg-white p-4 rounded-lg shadow hidden">
                    <h2 class="text-lg font-semibold mb-1">Emergency / Quick Actions</h2>
                    <div class="mt-2 p-3 bg-red-50 text-red-700 rounded text-sm">
                        Call Emergency:
                        <strong class="ml-1">+1-800-555-911</strong>
                    </div>
                    <div class="mt-3 flex flex-col sm:flex-row gap-2">
                        <button class="bg-red-600 text-white px-3 py-1 rounded text-sm">
                            Request Urgent Care
                        </button>
                        <button class="px-3 py-1 border rounded text-sm">
                            Share Medical ID
                        </button>
                    </div>
                </div>
            </section>

            <!-- Right sidebar -->
            <aside class="space-y-4">
                <div class="bg-white p-4 rounded-lg shadow">
                    <h3 class="font-semibold text-sm md:text-base">Quick Actions</h3>
                    <div class="mt-3">
                        <button class="w-full bg-green-500 text-white py-2 rounded text-sm">
                            Request Refill
                        </button>
                    </div>
                    <div class="mt-2">
                        <button class="w-full py-2 border rounded text-sm">
                            View Insurance
                        </button>
                    </div>
                </div>

                <div class="bg-white p-4 rounded-lg shadow">
                    <h3 class="font-semibold text-sm md:text-base">Notifications</h3>
                    <div class="text-sm text-gray-500 mt-2">No new notifications</div>
                </div>
            </aside>
        </div>
    </main>
</div>

<script>
    function showPanel(id, btn) {
        document.querySelectorAll('#nav button')
            .forEach(b => b.classList.remove('bg-indigo-50', 'text-indigo-600'));

        if (btn) btn.classList.add('bg-indigo-50', 'text-indigo-600');

        ['upcoming', 'records', 'prescriptions', 'billing', 'profile', 'messaging', 'notifications', 'emergency']
            .forEach(i => {
                var el = document.getElementById(i);
                if (el) el.classList.toggle('hidden', i !== id);
            });

        // On mobile, hide sidebar after selecting
        if (window.innerWidth < 768) {
            document.getElementById('sidebar').classList.add('hidden');
        }
    }

    function toggleSidebar() {
        var sb = document.getElementById('sidebar');
        sb.classList.toggle('hidden');
    }
</script>
</body>
</html>
