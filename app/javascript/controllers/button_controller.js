import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["btn"]

  change() {
    this.btnTarget.value = 'Added!'
    setTimeout(() => {
      this.btnTarget.setAttribute = ('readonly','true')
    }, 500);
  }
}
