import { Controller } from "@hotwired/stimulus"
import marked from 'marked'

export default class extends Controller {
  static targets = [ "input", "preview" ]

  connect() {
    this.updatePreview()
  }

  updatePreview() {
    const markdown = this.inputTarget.value
    const html = marked.parse(markdown, {
      gfm: true,
      breaks: true,
      sanitize: true
    })
    this.previewTarget.innerHTML = html
  }

  onInput() {
    this.updatePreview()
  }
}