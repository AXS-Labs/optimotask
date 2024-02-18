import { DefaultEvents, Emitter, Unsubscribe, createNanoEvents } from "nanoevents"

export const Events = {
  modalClose: 'modalClose',
}

class EventManager {
  private emitter: Emitter<DefaultEvents>
  private debug: boolean

  constructor(debug?) {
    this.debug = debug
    this.emitter = createNanoEvents()
  }

  on(event: string, callback: (extra?: any) => void): Unsubscribe {
    this.log(event, callback)
    return this.emitter.on(event, callback)
  }

  emit(event: string, extra?: any): void {
    this.log(event, extra)
    this.emitter.emit(event, extra)
  }

  onModalClose(callback: () => void): Unsubscribe {
    return this.on(Events.modalClose, callback)
  }

  emitModalClose() {
    return this.emit(Events.modalClose)
  }

  log(event: string, extra?: any): void {
    if (this.debug) {
      console.debug(event, extra)
    }
  }
}

const eventManager = new EventManager()

export { eventManager as default };
