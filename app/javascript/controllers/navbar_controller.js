import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["content"]
  initialize() {
    this.close();
    this.closeOnClickOutside = this.closeOnClickOutside.bind(this);
  }

  connect() {
    this.close()
    window.addEventListener("click", this.closeOnClickOutside);
  }

  toggle() {
    if (this.contentTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.contentTarget.classList.remove("hidden")
    let main = document.querySelector("main")
    main.classList.add("blur")
    document.body.classList.add("overflow-hidden")
  }

  close() {
    this.contentTarget.classList.add("hidden")
    let main = document.querySelector("main")
    main.classList.remove("blur")
    document.body.classList.remove("overflow-hidden")
  }

  closeOnLargerScreen(event) {
    if (window.innerWidth > 768) {
      this.close()
    }
  }

  closeWithEscape(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }

  closeOnClickOutside(event) {
    if (event.element === event.target || this.element.contains(event.target))  {
      return
    }
    this.close()
  }
}
