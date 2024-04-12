import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["region", "author", "date", "dateC", "regionC", "authorC"]

  execute() {
    this.regionCTarget.value = this.regionTarget.value
    this.authorCTarget.value = this.authorTarget.value
    this.dateCTarget.value = this.dateTarget.value
  }
}
