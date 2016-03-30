<wake-calc>
  <button class="wake-calc-btn" onclick={getSunrise}>
    <i class="fa fa-sun-o"></i>
  </button>
  <div class="wake-calc-options">
    <button onclick={calcWake} value="0"   id="at-sunrise"       class="hide">0</button>
    <button onclick={calcWake} value="-15" id="minus-fifteen"    class="hide">-15</button>
    <button onclick={calcWake} value="-30" id="minus-thirty"     class="hide">-30</button>
    <button onclick={calcWake} value="-45" id="minus-fourtyfive" class="hide">-45</button>
    <button onclick={calcWake} value="15"  id="plus-fifteen"     class="hide">+15</button>
    <button onclick={calcWake} value="30"  id="plus-thirty"      class="hide">+30</button>
    <button onclick={calcWake} value="45"  id="plus-fourtyfive"  class="hide">+45</button>
    <div class="wake-calc-result">
      <div class="wakeat">
        wake @
      </div>
      <div class="result">
        {wakeTime.moment}
      </div>

    </div>
  </div>


  this.wakeTime = {
    raw: Date.now(),
    moment: "Sunrise"
  }

  getSunrise(e) {
    $(".wake-calc-btn", this.root).hide();
    $(".wake-calc-options > button", this.root)
      .show()
      .toggleClass("show")
      .toggleClass("hide");
    $(".wake-calc-result")
      .show()
      .toggleClass("show");
  }

  calcWake(e) {
    var value = e.target.value;
    value = parseInt(value);
    this.wakeTime.moment = moment(this.wakeTime.raw).add(value, "minutes").format("hh:mm a");
    this.update();
  }

  test() {
    console.log("test");
  }
</wake-calc>
