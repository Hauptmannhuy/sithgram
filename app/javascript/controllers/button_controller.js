import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["btn"]

  change() {
    console.log(this.btnTarget.id)
    if (this.btnTarget.value == 'Add friend'){
      this.btnTarget.value = 'Added!'
    } else {
       if (this.btnTarget.value == 'Accept request'){
        this.btnTarget.value = 'Accepted!'
       let id = this.btnTarget.id.slice(-1)
       let btn = document.getElementById(`decline-btn-${id}`)

        btn.remove()
      }
      else {
        this.btnTarget.value = "Declined!"
       let id = this.btnTarget.id.slice(-1)
       let btn = document.getElementById(`accept-btn-${id}`)
        btn.remove()
      }  
    }
    setTimeout(() => {
      this.btnTarget.setAttribute('disabled','true')
    }, 100);
  }

}
