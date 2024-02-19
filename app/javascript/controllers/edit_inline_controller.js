import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-inline"
export default class extends Controller {
  submit() {
    this.element.requestSubmit()
  }
}
