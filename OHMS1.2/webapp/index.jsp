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
  <nav class="bg-white-700 px-5 py-8 flex items-center justify-between">
    <div class="flex items-center space-x-2">
      <span class="text-gray-700 text-2xl font-bold md:text-3xl">ES HealthWorks</span>
    </div>
    <div class="hidden md:flex space-x-6">
      <a href="index.jsp" class="text-gray-700 hover:text-blue-700 font-bold underline transition">Home</a>
      <a href="login.jsp" class="text-gray-700 hover:text-blue-700 transition">Patient Login</a>
      <a href="login.jsp?role=STAFF" class="text-gray-700 hover:text-blue-700 transition">Staff Login</a>
    </div>
  </nav>

  <!-- Hero -->
  <header class="relative text-white py-12 shadow-lg min-h-screen flex items-end overflow-hidden">
    <div class="absolute inset-0 w-full h-full z-0">
      <img id="hero-image" class="w-full h-full object-cover" src="<%= request.getContextPath() %>/assets/homepage-dna.jpg" alt="DNA background image">
      <!-- Gradient overlay at the bottom -->
      <div class="absolute inset-0 pointer-events-none" style="background: linear-gradient(to top, rgba(0,0,0,0.7) 40%, rgba(0,0,0,0.0) 80%);"></div>
    </div>
    <div class="container mx-auto px-6 pb-32 relative z-10">
      <h1 class="text-4xl md:text-6xl font-extrabold mb-2">Transforming Healthcare</h1>
      <button class="inline-flex items-center gap-2 text-white font-medium group transition-all">
        <span>Learn more about our innovative solutions</span>
        <svg class="w-4 h-4 transform transition-transform duration-200 group-hover:translate-x-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
          d="M9 5l7 7-7 7" />
        </svg>
      </button>
    </div>
  </header>
  <script>
    // Ensure video always fills the hero section responsively
    window.addEventListener('resize', fitHeroVideo);
    window.addEventListener('DOMContentLoaded', fitHeroVideo);

    function fitHeroVideo() {
      const header = document.querySelector('header');
      const video = document.getElementById('hero-video');
      if (header && video) {
        video.style.height = header.offsetHeight + 'px';
      }
    }
  </script>

  <!-- Dashboard Cards -->
  <main class="container mx-auto px-6 py-10 pt-40">
    <h1 class="text-4xl font-bold mb-4 text-center">What do you want to explore?</h1>
    <div class="flex flex-wrap justify-center gap-6 mt-6">
      <a href="patients.jsp" class="bg-white rounded-lg shadow px-6 py-8 flex flex-col items-center text-center hover:shadow-lg transition w-full sm:w-64 md:w-72 lg:w-80">
        <div class="p-3 rounded-full bg-blue-100 text-blue-600 mb-4">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path d="M16 7a4 4 0 10-8 0 4 4 0 008 0z"/>
            <path d="M12 14a7 7 0 00-7 7"/>
          </svg>
        </div>
        <h2 class="text-lg font-semibold">Why Choose ES HealthWorks?</h2>
      </a>

      <a href="doctors.jsp" class="bg-white rounded-lg shadow px-6 py-8 flex flex-col items-center text-center hover:shadow-lg transition w-full sm:w-64 md:w-72 lg:w-80">
        <div class="p-3 rounded-full bg-green-100 text-green-600 mb-4">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path d="M18 8a6 6 0 11-12 0 6 6 0 0112 0z"/>
            <path d="M12 14a7 7 0 00-7 7"/>
          </svg>
        </div>
        <h2 class="text-lg font-semibold">International Services</h2>
      </a>
    </div>

    <hr class="my-8 border-t border-gray-300">
  </main>
  <!-- Features Section -->
    <section id="next-section" class="container mx-auto px-5 md:px-20 py-10 mt-12">
      <div class="flex flex-col md:flex-row items-stretch gap-6">
      <!-- Left: Text -->
      <div class="flex-1 p-6" id="healing-text">
        <h2 class="text-2xl font-bold mb-4">Healing starts here</h2>
        <p class="mb-3 text-gray-700">Healing starts here means that ES HealthWorks aims to be the first and most reliable point of care for patients, offering support from the moment they seek help until they fully recover. It emphasizes a patient-centered journey where medical, emotional, and informational needs are addressed in one integrated system.</p>
        <p class="mb-3 text-gray-700">
        <b>The right answers the first time</b><br>
        Getting the right diagnosis early avoids unnecessary tests, delays in treatment, and complications that can worsen a patient’s condition. ES HealthWorks highlights that its experts handle complex and rare cases, using advanced tools and collaborative teams to reach accurate conclusions quickly.
        </p>
        <p class="mb-3 text-gray-700">
        <b>The world's best hospital</b><br>
        Describing ES HealthWorks as the No. 1 hospital in the world signals a commitment to high-quality care, safety standards, and excellent outcomes across many specialties. Mentioning Newsweek’s ranking builds trust by showing that this reputation is backed by an independent global evaluation of hospitals and their performance.
        </p>
      </div>

      <!-- Right: Image that matches the left column height -->
      <div class="flex-1 flex items-center justify-center">
        <div id="healing-img-wrapper" class="w-full">
        <img
          id="healing-img"
          src="<%= request.getContextPath() %>/assets/healing-starts-here-MC11REJU-600x800.jpg"
          alt="Descriptive alt text"
          class="w-full object-cover rounded-lg shadow"
          style="height: 100%; max-height: 600px;"
        >
        </div>
      </div>
      </div>
    </section>
    <script>
      // Dynamically set image height to match the left text column
      function syncHealingImgHeight() {
      const text = document.getElementById('healing-text');
      const img = document.getElementById('healing-img');
      if (text && img) {
        img.style.height = text.offsetHeight + 'px';
      }
      }
      window.addEventListener('resize', syncHealingImgHeight);
      window.addEventListener('DOMContentLoaded', syncHealingImgHeight);
    </script>
  <!-- Footer -->
  <footer class="bg-blue-700 text-blue-100 text-center py-4 mt-10">
    &copy; 2025 Online Healthcare Management System
  </footer>
</body>
<!-- Scroll-down arrow -->
<button
  id="scroll-down"
  type="button"
  aria-label="Scroll down"
  onclick="document.getElementById('next-section')?.scrollIntoView({ behavior: 'smooth' });"
  class="fixed bottom-6 right-6 z-50 bg-gray-300 backdrop-blur-sm text-blue-600 rounded-full shadow-lg w-10 h-10 flex items-center justify-center hover:bg-gray-300/80 transition-all"
>
  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
          d="M19 9l-7 7-7-7" />
  </svg>
</button>

<style>
  /* Bouncing animation */
  @keyframes ohms-bounce {
    0%, 100% { transform: translateY(0) scale(1); }
    50%     { transform: translateY(-6px) scale(1); }
  }

  /* Apply when visible */
  #scroll-down.bouncing {
    animation: ohms-bounce 1s ease-in-out infinite;
    will-change: transform, opacity;
  }
</style>

<script>
  const arrow = document.getElementById('scroll-down');
  const hero = document.querySelector('header') || document.getElementById('hero');

  function toggleArrow() {
    if (!arrow || !hero) return;
    const heroBottom = hero.offsetTop + hero.offsetHeight;
    const visible = window.scrollY <= heroBottom - 50;

    // Smooth opacity transition
    arrow.style.transition = 'opacity 200ms ease, transform 200ms ease';
    arrow.style.opacity = visible ? '1' : '0';
    arrow.style.pointerEvents = visible ? 'auto' : 'none';

    if (visible) {
      // Let the CSS animation run (animation defines scale(1))
      arrow.classList.add('bouncing');
      arrow.style.transform = ''; // clear any manual scale so animation can control transform
    } else {
      // Stop animation and slightly scale down when hidden
      arrow.classList.remove('bouncing');
      arrow.style.transform = 'scale(0.9)';
    }
  }

  window.addEventListener('scroll', toggleArrow);
  window.addEventListener('load', toggleArrow);
</script>

</html>
