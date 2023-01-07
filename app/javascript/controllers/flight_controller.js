import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["submit"]
  static targets = ["origin", "destination", "submit", "select", "booking"];

  connect() {
    // console.log("Hello, Stimulus!");
    // console.log(this.originTarget.value);
    // console.log(this.destinationTarget.value);
    // for start the search need to be selected the origin and destination
    this.originTarget.addEventListener("change", () => this.updateButton());
    this.destinationTarget.addEventListener("change", () =>
      this.updateButton()
    );

    // console.log(this.selectTarget.value);
    // for booking need to be selected the flight
    // this.selectTarget.addEventListener("change", () => this.bookButton());

    this.selectTargets.forEach((element) => {
      element.addEventListener("change", (event) => this.bookButton(event.currentTarget));
    });
    // this.bookingTargets.forEach((element) => {
    //   console.log(element.id)
    // });

  }

  updateButton() {
    if (this.originTarget.value && this.destinationTarget.value) {
      this.submitTarget.disabled = false;
    } else {
      this.submitTarget.disabled = true;
    }
  }
  bookButton(element) {
    console.log(element.id)
    let id = element.id.split('-')[1]
    // console.log(id)
    if (element.checked) {
    document.getElementById('submit-'+id).disabled = false;
    } else {
    document.getElementById('submit-'+id).disabled = true;
    }
  }
}
