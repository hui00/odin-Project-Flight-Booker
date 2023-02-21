import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = [ "template", "add_task" ]
  connect() {
    console.log("nested-form controller connected")

  }


  add(event) {
    console.log("add passenger")
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, new Date().getTime())
    this.add_taskTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove(event) {
    console.log("remove passenger")
    event.preventDefault()
    let item = event.target.closest('.nested-fields')
    item.querySelector('input[name*="_destroy"]').value = 1
    item.style.display = 'none'
  }
  
}
