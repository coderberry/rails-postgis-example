import { Controller } from "stimulus"

export default class extends Controller {
  selectedOption() {
    let value  = this.element.options[this.element.selectedIndex].value
    let locale = value == this.defaultLocale ? "" : value
    let url    = this.url.replace(/\/:locale/i, locale)

    if (locale == this.currentLocale) return

    window.location.replace(url)
  }

  get url() {
    return this.data.get("url")
  }

  get currentLocale() {
    return this.data.get("currentLocale")
  }

  get defaultLocale() {
    return this.data.get("defaultLocale")
  }
}

