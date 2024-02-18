import { Controller } from "@hotwired/stimulus"
import { Modal } from 'bootstrap'
import eventManager from "/services/event_service"

export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:frame-load', this.show.bind(this))
    this.element.addEventListener('turbo:before-frame-render', this.close.bind(this))
    this.unregisterCloseEvent = eventManager.onModalClose(this.close.bind(this))

    this.show()
  }

  close() {
    if (!this.getModalElement()) return
    const modal = Modal.getInstance(this.getModalElement())

    if (!modal) return

    modal.hide()

    this.element.src = null
    this.element.replaceChildren()
  }

  show() {
    if (!this.getModalElement()) return

    const modal = Modal.getOrCreateInstance(this.getModalElement())
    modal.show()
  }

  disconnect() {
    this.unregisterCloseEvent()
    this.element.removeEventListener('turbo:frame-load', this.show.bind(this))
    this.element.removeEventListener('turbo:before-frame-render', this.close.bind(this))

    if (!this.getModalElement()) return
    const modal = Modal.getInstance(this.getModalElement())

    if (!modal) return

    modal.dispose()
  }

  getModalElement() {
    return this.element.querySelector('.modal')
  }
}
