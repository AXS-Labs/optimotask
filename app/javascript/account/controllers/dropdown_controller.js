import { Controller } from "@hotwired/stimulus"
import { Dropdown } from 'bootstrap'

export default class extends Controller {
  connect() {
    this.dropdown = new Dropdown(this.element)
  }

  disconnect() {
    this.dropdown.dispose()
  }

  toggle() {
    this.dropdown.toggle()
  }
}
