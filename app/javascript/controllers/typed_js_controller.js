import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["vetting", "documentation", "progress monitoring", "sending lease", "arranging access"],
      typeSpeed: 50,
      loop: true
    })
  }
}
