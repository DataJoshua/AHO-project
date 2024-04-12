import Flatpickr from 'stimulus-flatpickr'

export default class extends Flatpickr {
  initialize() {
    this.config = {
      mode: "range",
      dateFormat: "d/m/Y",
    }
  }
}
