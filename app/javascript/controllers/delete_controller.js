// app/javascript/controllers/delete_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["element"];

  delete() {
    if (confirm("本当に削除しますか?")) {
      this.element.remove();
    }
  }
}
