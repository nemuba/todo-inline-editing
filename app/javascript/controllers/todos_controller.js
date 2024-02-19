import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="todos"
export default class extends Controller {
  search() {
    this.element.requestSubmit()
  }

  
}
