import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener('turbo:before-visit', function(event) {
    if (event.data.method === 'DELETE' && event.data.url.includes('/users/sign_out')) {
      event.preventDefault();
      Turbolinks.visit('/');
    }
  });
  