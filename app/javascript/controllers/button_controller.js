import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["btn"]

  change() {
    if (this.btnTarget.value == 'Add friend'){
      this.btnTarget.value = 'Added!'
    }
    else if (this.btnTarget.value == 'Accept request'){
      this.btnTarget.value = 'Accepted!'
    }  
    setTimeout(() => {
      this.btnTarget.setAttribute = ('readonly','true')
    }, 500);
  }
}
