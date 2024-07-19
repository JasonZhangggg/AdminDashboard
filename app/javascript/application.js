// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", () => {
  let form = document.querySelector("#dropdown");
  let menu = document.querySelector("#dropdown-content");
  document.addEventListener("click", (event) => {
    if (!form.contains(event.target)) {
      menu.classList.add("hidden");
    }
  });

  form.addEventListener("click", toggleMenu);
});

const toggleMenu = () => {
  let menu = document.querySelector("#dropdown-content");
  menu.classList.toggle("hidden");
};
