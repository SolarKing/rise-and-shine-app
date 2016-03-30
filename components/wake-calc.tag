<wake-calc>
  <button class="wake-calc-btn" onclick={getSunrise}>
    <i class="fa fa-sun-o"></i>
  </button>
  <div class='uil-ripple-css' style='transform:scale(0.37);'><div></div><div></div></div>
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
    raw: null,
    moment: null,
  }

  this.url = null;

  var self = this;

  this.on("mount", function() {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(function(pos) {
        var url = "http://api.sunrise-sunset.org/json";
        url += "?lat=" + pos.coords.latitude;
        url += "&lng=" + pos.coords.longitude;
        url += "&formatted=0";
        self.url = url;
        $(".wake-calc-btn", self.root)
          .show()
          .addClass("show");
        $(".uil-ripple-css", self.root)
          .hide();
      });

    } else {
      alert("Geolocation not available :C");
    }
  });

  getSunrise(e) {

    $.get(self.url.toString(), function(data) {
      self.wakeTime.raw = data.results.sunrise;
      self.wakeTime.moment = moment(self.wakeTime.raw).format("hh:mm a");
      self.update();
      $(".wake-calc-btn", self.root).hide();
      $(".wake-calc-options > button", self.root)
        .show()
        .toggleClass("show")
        .toggleClass("hide");
      $(".wake-calc-result")
        .show()
        .toggleClass("show");
    });

  }

  calcWake(e) {
    var value = e.target.value;
    value = parseInt(value);
    self.wakeTime.moment = moment(self.wakeTime.raw).add(value, "minutes").format("hh:mm a");
    this.update();
  }

  test() {
    console.log("test");
  }
</wake-calc>
