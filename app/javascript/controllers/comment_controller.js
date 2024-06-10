import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["comment"]
  
  update(){
    let target = this.commentTarget;
    if(target.value == ''){
      alert('Comment input cannot be blank!');
    }
     else {
      setTimeout(() => {
        target.value = '';
      }, 100);
  
     }
  }

}