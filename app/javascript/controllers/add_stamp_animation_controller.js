import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['stamp', 'last'];

  connect() {
    console.log("hello from add_stamp");
    console.log(this.stampTarget);
    console.log(this.lastTarget);
  }
}
