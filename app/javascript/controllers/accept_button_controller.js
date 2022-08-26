import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accept-button"
export default class extends Controller {
  static targets = ["status", "accept", "buttons"]

  connect() {
    console.log(this.element)
    console.log("status target", this.statusTarget)
    // console.log(this.acceptTarget)
  }

  send(event) {
    event.preventDefault();
    fetch(this.acceptTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.acceptTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.statusTarget.innerHTML = data.status;
        this.buttonsTarget.innerHTML = data.buttons;
      })
  }
}
