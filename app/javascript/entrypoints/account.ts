import { Turbo } from "@hotwired/turbo-rails"
import "@tabler/core"
import { Application } from "@hotwired/stimulus"
import { definitionsFromGlob } from 'stimulus-vite-helpers'
import eventManager from "../services/event_service"

const controllers = import.meta.glob('../account/controllers/**/*_controller.(js|ts)', { eager: true })

const application = Application.start()
application.load(definitionsFromGlob(controllers))

Turbo.StreamActions.redirect = function() {
  Turbo.visit(this.target);
};

Turbo.StreamActions.close_modal = function() {
  eventManager.emitModalClose()
};
