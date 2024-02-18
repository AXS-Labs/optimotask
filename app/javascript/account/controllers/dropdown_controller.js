import { Controller } from "@hotwired/stimulus"
import { Dropdown } from 'bootstrap'

export default class extends Controller {
  connect() {
    this.dropdown = new Dropdown(this.element)
    console.log(this.dropdown)
  }

  disconnect() {
    this.dropdown.dispose()
  }

  toggle() {
    this.dropdown.toggle()
  }
}
