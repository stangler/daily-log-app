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
    if (suggestions.length === 0) {
      this.suggestionsTarget.style.display = "none"
      return
    }

    this.suggestionsTarget.innerHTML = suggestions.map(suggestion => `
      <div class="suggestion" data-tag="${suggestion}">
        ${suggestion}
      </div>
    `).join("")

    this.suggestionsTarget.style.display = "block"
    this.suggestionsTarget.querySelectorAll(".suggestion").forEach(suggestion => {
      suggestion.addEventListener("click", (e) => this.selectTag(e))
    })
  }

  selectTag(event) {
    const selectedTag = event.target.dataset.tag
    const currentTags = this.inputTarget.value.split(",").map(tag => tag.trim())
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