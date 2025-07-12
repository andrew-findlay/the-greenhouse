#!/bin/bash

# The Greenhouse Jekyll Site Setup Script
# Run this script in your the-greenhouse directory

echo "🌱 Setting up The Greenhouse Jekyll site..."

# Create directory structure
mkdir -p _layouts _includes _sass assets/css assets/js

echo "📁 Created directory structure"

# Create _config.yml
cat > _config.yml << 'EOF'
# Site settings
title: The Greenhouse
email: hello@thegreenhouse.coach
description: >-
  Where growth happens naturally and transformation takes root.
  Professional coaching consultancy helping individuals and teams flourish.
baseurl: ""
url: "https://yourusername.github.io"

# Business info
business:
  name: "The Greenhouse Coaching Consultancy"
  tagline: "Growing together, one conversation at a time"
  phone: "+1 (555) 123-4567"
  email: "hello@thegreenhouse.coach"
  address: "Your City, Your State"

# Navigation
navigation:
  - title: "Home"
    url: "#home"
  - title: "About"
    url: "#about"
  - title: "Services"
    url: "#services"
  - title: "Contact"
    url: "#contact"

# Services
services:
  - title: "Personal Coaching"
    icon: "🌱"
    description: "One-on-one sessions to help you identify goals, overcome obstacles, and create positive changes in your life."
  - title: "Leadership Development"
    icon: "🌿"
    description: "Develop your leadership skills and learn to inspire and guide others while staying true to your authentic self."
  - title: "Team Building"
    icon: "🌳"
    description: "Help your team grow together, improve communication, and create a positive, productive work environment."
  - title: "Career Transition"
    icon: "🌻"
    description: "Navigate career changes with confidence and clarity, finding paths that align with your values and goals."
  - title: "Work-Life Balance"
    icon: "🍃"
    description: "Create harmony between your professional and personal life, reducing stress and increasing satisfaction."
  - title: "Confidence Building"
    icon: "🌺"
    description: "Develop unshakeable self-confidence and learn to trust in your abilities and decision-making skills."

# About cards
about_cards:
  - title: "Nurturing Growth"
    icon: "🌿"
    description: "We believe everyone has the potential to grow and thrive. Our role is to provide the right environment, tools, and guidance to help you flourish."
  - title: "Sustainable Change"
    icon: "💡"
    description: "Like healthy plants that grow strong roots, we focus on creating lasting, sustainable transformations that will serve you for years to come."
  - title: "Organic Process"
    icon: "🚀"
    description: "Growth can't be forced, but it can be facilitated. We work with your natural rhythms and strengths to create authentic, meaningful change."

# Build settings
markdown: kramdown
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag

# Exclude from processing
exclude:
  - .sass-cache/
  - .jekyll-cache/
  - Gemfile
  - Gemfile.lock
  - node_modules/
  - vendor/
  - README.md
EOF

echo "⚙️ Created _config.yml"

# Create Gemfile
cat > Gemfile << 'EOF'
source "https://rubygems.org"

gem "jekyll", "~> 4.3.0"
gem "minima", "~> 2.5"

# Ruby 3.4+ compatibility
gem "csv"
gem "logger"
gem "base64"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sitemap"
  gem "jekyll-seo-tag"
end

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
EOF

echo "💎 Created Gemfile"

# Create _layouts/default.html
cat > _layouts/default.html << 'EOF'
<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang | default: 'en' }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    {%- seo -%}
    
    <link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
    
    <!-- Favicon -->
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🌱</text></svg>">
    
    {%- feed_meta -%}
</head>

<body>
    {%- include header.html -%}

    <main class="page-content" aria-label="Content">
        {{ content }}
    </main>

    {%- include footer.html -%}
    
    <script src="{{ '/assets/js/main.js' | relative_url }}"></script>
</body>

</html>
EOF

echo "📄 Created default layout"

# Create _includes/header.html
cat > _includes/header.html << 'EOF'
<header class="site-header">
    <nav class="container">
        <div class="logo">
            <span class="logo-icon">🌱</span>
            <span class="logo-text">{{ site.title }}</span>
        </div>
        
        <ul class="nav-links">
            {%- for item in site.navigation -%}
            <li><a href="{{ item.url }}">{{ item.title }}</a></li>
            {%- endfor -%}
        </ul>
        
        <!-- Mobile menu button -->
        <button class="mobile-menu-btn" aria-label="Toggle menu" onclick="toggleMobileMenu()">
            <span></span>
            <span></span>
            <span></span>
        </button>
    </nav>
</header>
EOF

echo "🧭 Created header"

# Create _includes/footer.html
cat > _includes/footer.html << 'EOF'
<footer class="site-footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>{{ site.business.name }}</h3>
                <p>{{ site.business.tagline }}</p>
                <p>{{ site.description }}</p>
            </div>
            
            <div class="footer-section">
                <h4>Contact Info</h4>
                <p>📧 {{ site.business.email }}</p>
                {%- if site.business.phone -%}
                <p>📞 {{ site.business.phone }}</p>
                {%- endif -%}
                {%- if site.business.address -%}
                <p>📍 {{ site.business.address }}</p>
                {%- endif -%}
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; {{ 'now' | date: "%Y" }} {{ site.business.name }}. All rights reserved.</p>
            <p>Growing together, one conversation at a time. 🌱</p>
        </div>
    </div>
</footer>
EOF

echo "🦶 Created footer"

# Create _includes/contact-form.html
cat > _includes/contact-form.html << 'EOF'
<form class="contact-form" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
    <div class="form-row">
        <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" required>
        </div>
    </div>
    
    <div class="form-row">
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone">
        </div>
        <div class="form-group">
            <label for="service">Service of Interest</label>
            <select id="service" name="service">
                <option value="">Select a service...</option>
                {%- for service in site.services -%}
                <option value="{{ service.title | slugify }}">{{ service.title }}</option>
                {%- endfor -%}
                <option value="other">Other</option>
            </select>
        </div>
    </div>
    
    <div class="form-group">
        <label for="message">Message *</label>
        <textarea id="message" name="message" placeholder="Tell us about your goals and how we can help you grow..." required></textarea>
    </div>
    
    <!-- Hidden fields for form identification -->
    <input type="hidden" name="_subject" value="New contact from {{ site.title }}">
    <input type="hidden" name="_next" value="{{ site.url }}{{ site.baseurl }}/thank-you">
    
    <button type="submit" class="submit-btn">
        <span>Send Message</span>
        <span class="btn-icon">🌱</span>
    </button>
</form>

<div class="form-note">
    <p><small>* Required fields</small></p>
    <p><small>We'll get back to you within 24 hours. Your information is kept confidential.</small></p>
</div>
EOF

echo "📝 Created contact form"

# Create index.html
cat > index.html << 'EOF'
---
layout: default
title: Home
description: Professional coaching consultancy helping individuals and teams flourish and grow naturally.
---

<section id="home" class="hero-section">
    <div class="container">
        <div class="hero-content">
            <h1>Welcome to {{ site.title }}</h1>
            <p>{{ site.description }}</p>
            <a href="#about" class="cta-button">Discover Your Potential</a>
        </div>
    </div>
</section>

<section id="about" class="about-section">
    <div class="container">
        <div class="section-content">
            <h2>About {{ site.title }}</h2>
            <p>Just like a greenhouse provides the perfect environment for plants to flourish, we create the ideal conditions for personal and professional growth. Our coaching approach nurtures your natural abilities while providing the structure and support you need to reach new heights.</p>
            
            <div class="about-grid">
                {%- for card in site.about_cards -%}
                <div class="about-card">
                    <div class="card-icon">{{ card.icon }}</div>
                    <h3>{{ card.title }}</h3>
                    <p>{{ card.description }}</p>
                </div>
                {%- endfor -%}
            </div>
        </div>
    </div>
</section>

<section id="services" class="services-section">
    <div class="container">
        <div class="section-content">
            <h2>Our Services</h2>
            <p>We offer a range of coaching services designed to help you grow, flourish, and reach your full potential in both personal and professional settings.</p>
            
            <div class="services-grid">
                {%- for service in site.services -%}
                <div class="service-card">
                    <span class="service-icon">{{ service.icon }}</span>
                    <h3>{{ service.title }}</h3>
                    <p>{{ service.description }}</p>
                </div>
                {%- endfor -%}
            </div>
        </div>
    </div>
</section>

<section id="contact" class="contact-section">
    <div class="container">
        <div class="section-content">
            <h2>Contact Us</h2>
            <p>Ready to start your growth journey? We'd love to hear from you and learn about your goals. Reach out today to schedule a consultation.</p>
            
            {%- include contact-form.html -%}
        </div>
    </div>
</section>
EOF

echo "🏠 Created homepage"

# Create CSS file (truncated for brevity - you'll need to add the full CSS)
cat > assets/css/style.scss << 'EOF'
---
---

// Variables
$primary-green: #2c5530;
$light-green: #4a7c59;
$accent-green: #66d9a3;
$text-dark: #333;
$text-light: #666;
$white: #fff;
$border-radius: 15px;
$box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
$transition: all 0.3s ease;

// Mixins
@mixin gradient-bg($start, $end) {
  background: linear-gradient(135deg, $start 0%, $end 100%);
}

@mixin glass-effect {
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

// Reset & Base
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  line-height: 1.6;
  color: $text-dark;
  @include gradient-bg(#667eea, #764ba2);
  min-height: 100vh;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

// Header
.site-header {
  @include glass-effect;
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 1000;
  box-shadow: $box-shadow;

  nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 0;
  }

  .logo {
    font-size: 1.8rem;
    font-weight: bold;
    color: $primary-green;
    display: flex;
    align-items: center;
    text-decoration: none;

    .logo-icon {
      margin-right: 0.5rem;
      font-size: 2rem;
    }

    .logo-text {
      font-weight: 700;
    }
  }

  .nav-links {
    display: flex;
    list-style: none;
    gap: 2rem;

    a {
      text-decoration: none;
      color: $text-dark;
      font-weight: 500;
      padding: 0.5rem 1rem;
      border-radius: 25px;
      transition: $transition;

      &:hover {
        background: $primary-green;
        color: $white;
        transform: translateY(-2px);
      }
    }
  }

  .mobile-menu-btn {
    display: none;
    background: none;
    border: none;
    flex-direction: column;
    cursor: pointer;
    padding: 5px;

    span {
      width: 25px;
      height: 3px;
      background: $primary-green;
      margin: 2px 0;
      transition: $transition;
    }
  }
}

// Main sections
.page-content {
  margin-top: 80px;
}

section {
  min-height: 100vh;
  padding: 4rem 0;
  display: flex;
  align-items: center;
}

.section-content {
  @include glass-effect;
  border-radius: $border-radius;
  padding: 3rem;
  margin: 2rem 0;
  box-shadow: $box-shadow;
  width: 100%;

  h2 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    color: $primary-green;
    text-align: center;
  }

  > p {
    font-size: 1.1rem;
    text-align: center;
    margin-bottom: 2rem;
    color: $text-light;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
  }
}

// Hero Section
.hero-section {
  text-align: center;
  @include gradient-bg(#667eea, #764ba2);

  .hero-content {
    color: $white;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(255, 255, 255, 0.2);

    h1 {
      font-size: 3.5rem;
      margin-bottom: 1rem;
      background: linear-gradient(45deg, $white, #e0e7ff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    p {
      font-size: 1.2rem;
      margin-bottom: 2rem;
      opacity: 0.9;
      color: $white !important;
    }
  }

  .cta-button {
    display: inline-block;
    padding: 1rem 2rem;
    background: linear-gradient(45deg, $primary-green, $light-green);
    color: $white;
    text-decoration: none;
    border-radius: 50px;
    font-weight: bold;
    transition: $transition;
    box-shadow: 0 4px 15px rgba(44, 85, 48, 0.3);

    &:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 25px rgba(44, 85, 48, 0.4);
    }
  }
}

// About Section
.about-section {
  @include gradient-bg(#a8edea, #fed6e3);

  .about-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-top: 2rem;
  }

  .about-card {
    background: rgba(255, 255, 255, 0.8);
    padding: 2rem;
    border-radius: $border-radius;
    text-align: center;
    transition: $transition;

    &:hover {
      transform: translateY(-5px);
    }

    .card-icon {
      font-size: 3rem;
      margin-bottom: 1rem;
    }

    h3 {
      color: $primary-green;
      margin-bottom: 1rem;
      font-size: 1.3rem;
    }

    p {
      color: $text-light;
      line-height: 1.6;
    }
  }
}

// Services Section
.services-section {
  @include gradient-bg(#ffecd2, #fcb69f);

  .services-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 2rem;
    margin-top: 2rem;
  }

  .service-card {
    background: rgba(255, 255, 255, 0.9);
    padding: 2rem;
    border-radius: $border-radius;
    text-align: center;
    transition: $transition;
    border: 2px solid transparent;

    &:hover {
      transform: translateY(-5px);
      border-color: $primary-green;
    }

    .service-icon {
      font-size: 3rem;
      margin-bottom: 1rem;
      display: block;
    }

    h3 {
      color: $primary-green;
      margin-bottom: 1rem;
      font-size: 1.3rem;
    }

    p {
      color: $text-light;
      line-height: 1.6;
    }
  }
}

// Contact Section
.contact-section {
  @include gradient-bg(#d299c2, #fef9d7);

  .contact-form {
    max-width: 700px;
    margin: 2rem auto 0;
  }

  .form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
    margin-bottom: 1.5rem;

    @media (max-width: 768px) {
      grid-template-columns: 1fr;
    }
  }

  .form-group {
    margin-bottom: 1.5rem;

    label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: bold;
      color: $primary-green;
    }

    input,
    textarea,
    select {
      width: 100%;
      padding: 1rem;
      border: 2px solid #ddd;
      border-radius: 10px;
      font-size: 1rem;
      transition: border-color 0.3s ease;
      font-family: inherit;

      &:focus {
        outline: none;
        border-color: $primary-green;
      }
    }

    textarea {
      resize: vertical;
      min-height: 120px;
    }
  }

  .submit-btn {
    width: 100%;
    padding: 1rem;
    background: linear-gradient(45deg, $primary-green, $light-green);
    color: $white;
    border: none;
    border-radius: 10px;
    font-size: 1.1rem;
    font-weight: bold;
    cursor: pointer;
    transition: $transition;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(44, 85, 48, 0.3);
    }

    .btn-icon {
      font-size: 1.2rem;
    }
  }

  .form-note {
    margin-top: 1rem;
    text-align: center;
    
    p {
      margin: 0.5rem 0;
      color: $text-light;
    }
  }
}

// Footer
.site-footer {
  background: rgba(44, 85, 48, 0.9);
  color: $white;
  padding: 3rem 0 1rem;
  margin-top: 2rem;

  .footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
  }

  .footer-section {
    h3, h4 {
      margin-bottom: 1rem;
      color: $white;
    }

    p {
      margin-bottom: 0.5rem;
      opacity: 0.9;
    }
  }

  .footer-bottom {
    text-align: center;
    padding-top: 2rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    
    p {
      margin: 0.5rem 0;
      opacity: 0.8;
    }
  }
}

// Responsive Design
@media (max-width: 768px) {
  .hero-section .hero-content h1 {
    font-size: 2.5rem;
  }

  .section-content {
    padding: 2rem;

    h2 {
      font-size: 2rem;
    }
  }

  .site-header {
    .nav-links {
      display: none;
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      background: rgba(255, 255, 255, 0.95);
      flex-direction: column;
      padding: 1rem 0;
      gap: 0;
      box-shadow: $box-shadow;

      &.active {
        display: flex;
      }

      li {
        padding: 0.5rem 0;
      }
    }

    .mobile-menu-btn {
      display: flex;
    }
  }

  .about-grid,
  .services-grid {
    grid-template-columns: 1fr;
  }

  .footer-content {
    grid-template-columns: 1fr;
    text-align: center;
  }
}

// Smooth Scrolling
html {
  scroll-behavior: smooth;
}
EOF

echo "🎨 Created stylesheet"

# Create JavaScript file
cat > assets/js/main.js << 'EOF'
// Mobile menu toggle
function toggleMobileMenu() {
    const navLinks = document.querySelector('.nav-links');
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    
    navLinks.classList.toggle('active');
    mobileMenuBtn.classList.toggle('active');
}

// Smooth scrolling for navigation links
document.addEventListener('DOMContentLoaded', function() {
    // Handle navigation clicks
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerOffset = 80;
                const elementPosition = target.offsetTop;
                const offsetPosition = elementPosition - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });

                // Close mobile menu if open
                const navLinks = document.querySelector('.nav-links');
                const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
                if (navLinks.classList.contains('active')) {
                    navLinks.classList.remove('active');
                    mobileMenuBtn.classList.remove('active');
                }
            }
        });
    });

    // Add active class to navigation links based on scroll position
    const sections = document.querySelectorAll('section');
    const navLinks = document.querySelectorAll('.nav-links a');

    function updateActiveNavLink() {
        let current = '';
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.clientHeight;
            if (window.scrollY >= sectionTop - 200) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === '#' + current) {
                link.classList.add('active');
            }
        });
    }

    window.addEventListener('scroll', updateActiveNavLink);
    updateActiveNavLink();

    // Form submission handling
    const contactForm = document.querySelector('.contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            const submitBtn = this.querySelector('.submit-btn');
            const originalText = submitBtn.innerHTML;
            
            submitBtn.innerHTML = '<span>Sending...</span> <span class="btn-icon">⏳</span>';
            submitBtn.disabled = true;

            setTimeout(() => {
                submitBtn.innerHTML = originalText;
                submitBtn.disabled = false;
            }, 5000);
        });
    }
});

// Add CSS for mobile menu
const style = document.createElement('style');
style.textContent = `
    .nav-links.active {
        display: flex !important;
    }
    
    .nav-links a.active {
        background: #2c5530;
        color: white;
    }
    
    .mobile-menu-btn.active span:nth-child(1) {
        transform: rotate(45deg) translate(5px, 5px);
    }
    
    .mobile-menu-btn.active span:nth-child(2) {
        opacity: 0;
    }
    
    .mobile-menu-btn.active span:nth-child(3) {
        transform: rotate(-45deg) translate(7px, -6px);
    }
`;
document.head.appendChild(style);
EOF

echo "📜 Created JavaScript file"

# Create .gitignore
cat > .gitignore << 'EOF'
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
.bundle/
vendor/
Gemfile.lock
EOF

echo "🙈 Created .gitignore"

# Create README
cat > README.md << 'EOF'
# The Greenhouse - Coaching Consultancy Website

A beautiful, modern Jekyll site for The Greenhouse coaching consultancy.

## Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Start development server:
   ```bash
   bundle exec jekyll serve --livereload
   ```

3. Visit http://localhost:4000

## Configuration

- Edit `_config.yml` to update business information
- Replace `YOUR_FORM_ID` in `_includes/contact-form.html` with your Formspree form ID
- Update contact information and social links

## Deployment

This site is ready for GitHub Pages deployment. Just push to your repository and enable GitHub Pages in the settings.

## Features

- 🌱 Beautiful, whimsical design with greenhouse theme
- 📱 Fully responsive mobile-first design
- 🎨 Modern gradients and glassmorphism effects
- 📧 Contact form with Formspree integration
- 🔍 SEO optimized with Jekyll SEO plugin
- ⚡ Fast loading with optimized assets

Built with Jekyll and 💚 by Claude
EOF

echo "📖 Created README"

echo ""
echo "🌱 The Greenhouse Jekyll site has been created successfully!"
echo ""
echo "Next steps:"
echo "1. Update _config.yml with your business information"
echo "2. Replace YOUR_FORM_ID in _includes/contact-form.html with your Formspree form ID"
echo "3. Run: bundle install"
echo "4. Run: bundle exec jekyll serve --livereload"
echo "5. Visit: http://localhost:4000"
echo ""
echo "🚀 Your beautiful coaching site is ready to grow!"
EOF

echo "🌱 Created complete setup script!"