// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require popper
//= require bootstrap
//= require_tree .

document.addEventListener('turbo:before-visit', function(event) {
    if (event.data.method === 'DELETE' && event.data.url.includes('/users/sign_out')) {
      event.preventDefault();
      Turbolinks.visit('/');
    }
  });
  