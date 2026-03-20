import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "suggestions", "form" ]
  static values = { tags: Array }

  connect() {
    this.suggestionsTarget.style.display = "none"
    this.availableTags = this.tagsValue || []
  }

  searchTags(event) {
    const query = event.target.value.toLowerCase()
    const suggestions = this.availableTags.filter(tag =>
      tag.toLowerCase().includes(query) && tag.toLowerCase() !== query
    ).slice(0, 10)

    this.showSuggestions(suggestions)
  }

  showSuggestions(suggestions) {
    // 既存の候補をクリア
    this.suggestionsTarget.replaceChildren()

    if (suggestions.length === 0) {
      this.suggestionsTarget.style.display = "none"
      return
    }

    suggestions.forEach(suggestion => {
      // innerHTML を使わず DOM API で要素を生成（XSS対策）
      const div = document.createElement("div")
      div.className = "suggestion cursor-pointer px-4 py-2 hover:bg-gray-100"
      div.dataset.tag = suggestion
      div.textContent = suggestion  // textContent でエスケープ済みテキストとして挿入
      div.addEventListener("click", (e) => this.selectTag(e))
      this.suggestionsTarget.appendChild(div)
    })

    this.suggestionsTarget.style.display = "block"
  }

  selectTag(event) {
    const selectedTag = event.currentTarget.dataset.tag
    const currentTags = this.inputTarget.value
      .split(",")
      .map(tag => tag.trim())
      .filter(tag => tag.length > 0)

    if (!currentTags.includes(selectedTag)) {
      currentTags.push(selectedTag)
      this.inputTarget.value = currentTags.join(", ")
    }
    this.suggestionsTarget.style.display = "none"
  }

  hideSuggestions() {
    this.suggestionsTarget.style.display = "none"
  }
}
