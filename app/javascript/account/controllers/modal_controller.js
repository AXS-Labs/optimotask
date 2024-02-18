import { Controller } from "@hotwired/stimulus"
import { Modal } from 'bootstrap'
import eventManager from "/services/event_service"

export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)

    this.modal.show()

    this.unregisterCloseEvent = eventManager.onModalClose(this.hide.bind(this))
  }

  hide() {
    this.modal.hide()
  }

  disconnect() {
    this.unregisterCloseEvent()
    this.modal.dispose()
  }
}
