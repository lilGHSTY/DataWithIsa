// DataWithIsa - Main JavaScript
document.addEventListener('DOMContentLoaded', function() {
    console.log('DataWithIsa initialized');
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Add active class to current nav item
    const currentLocation = location.pathname;
    const menuItems = document.querySelectorAll('.nav-menu a');
    menuItems.forEach(item => {
        if (item.getAttribute('href') === currentLocation) {
            item.classList.add('active');
        }
    });
});