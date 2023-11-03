import { Controller } from "@hotwired/stimulus"

export default class MultiUploadController extends Controller {
  static targets = ["inputButton", "submitButton", "files"]

  connect() {
    document.addEventListener("turbo:frame-load", this.showLatestInputFieldOnly.bind(this));
  }

  get latestInputButton() {
    return this.inputButtonTargets[this.inputButtonTargets.length - 1];
  }

  get latestFileInput() {
    return this.filesTargets[this.filesTargets.length - 1];
  }

  submitOnInput() {
    const latestFileInput = this.latestFileInput;
    if (latestFileInput.value) {
      this.submitButtonTarget.click();
    }
  }

  showLatestInputFieldOnly() {
    this.inputButtonTargets.forEach(
      inputButton => inputButton.style.display = "none"
    );
    this.latestInputButton.style.display = "block";
  }
}
