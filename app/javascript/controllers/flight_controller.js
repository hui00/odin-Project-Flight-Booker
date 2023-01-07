import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["submit"]
  static targets = ["origin", "destination", "submit", "select", "booking"];

  connect() {
    console.log("Hello, Stimulus!");
    console.log(this.originTarget.value);
    console.log(this.destinationTarget.value);
    console.log(this.selectTarget.value);

    // for start the search need to be selected the origin and destination
    this.originTarget.addEventListener("change", () => this.updateButton());
    this.destinationTarget.addEventListener("change", () =>
      this.updateButton()
    );


    // for booking need to be selected the flight
    this.selectTarget.addEventListener("change", () => this.bookButton());
      

  }

  updateButton() {
    if (this.originTarget.value && this.destinationTarget.value) {
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  }
  bookButton() {
    console.log(this.selectTarget.checked);
    if (this.selectTarget.checked) {
      this.bookingTarget.disabled = false;
      // this.bookingTarget.classList.remove("hidden");
    } else {
      this.bookingTarget.disabled = true;
      // this.bookingTarget.classList.add("hidden");
    }

  }
}
