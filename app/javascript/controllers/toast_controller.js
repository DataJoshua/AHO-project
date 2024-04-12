import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["wrapper"]

  execute() {
    this.wrapperTarget.style.display = "none";
  }
}
