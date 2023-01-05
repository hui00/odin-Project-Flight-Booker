import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["submit"]
  static targets = ["origin", "destination", "submit"];

  connect() {
    console.log("Hello, Stimulus!");
    console.log(this.originTarget.value);
    console.log(this.destinationTarget.value);
    this.originTarget.addEventListener("change", () => this.updateButton());
    this.destinationTarget.addEventListener("change", () =>
      this.updateButton()
    );

    // this.checkFields()
  }

  updateButton() {
    if (this.originTarget.value && this.destinationTarget.value) {
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  }
}
