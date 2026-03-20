import { Controller } from "@hotwired/stimulus"
import { marked } from "marked"
import DOMPurify from "dompurify"

export default class extends Controller {
  static targets = [ "input", "preview" ]

  connect() {
    this.updatePreview()
  }

  updatePreview() {
    const markdown = this.inputTarget.value

    // marked でHTMLに変換し、DOMPurify でサニタイズしてから挿入（XSS対策）
    // 注意: marked v5以降 sanitize オプションは削除されているため使用しない
    const rawHtml = marked.parse(markdown, {
      gfm: true,
      breaks: true
    })

    this.previewTarget.innerHTML = DOMPurify.sanitize(rawHtml)
  }

  onInput() {
    this.updatePreview()
  }
}
