import { Controller } from "@hotwired/stimulus"
import { Offcanvas } from "bootstrap"
// Connects to data-controller="off-canvas"
export default class extends Controller {
  connect() {
    this.offcanvas = new Offcanvas(this.element)
    this.offcanvas.show()
  }
}
