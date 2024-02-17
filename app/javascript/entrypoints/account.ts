import { Turbo } from "@hotwired/turbo-rails"
import "@tabler/core"
import { Application } from "@hotwired/stimulus"
import { definitionsFromGlob } from 'stimulus-vite-helpers'

const controllers = import.meta.glob('../account/controllers/**/*_controller.(js|ts)', { eager: true })

const application = Application.start()
application.load(definitionsFromGlob(controllers))

Turbo.StreamActions.redirect = function() {
  Turbo.visit(this.target);
};
