window.HTTPMethodEmulator = {
  key: "_method",
  handler: function(form) {
    var method = form.querySelector("input[name='" + this.key + "']");

    if (method === null)
      return;
    var httpMethod = method.getAttribute("value").toUpperCase();

    if (httpMethod == "POST")
      return;

    var url = new URL(form.action, location.origin);
    url.searchParams.set(this.key, httpMethod);
    form.action = url.href;
  }
}

document.addEventListener("submit", function (e) {
  window.HTTPMethodEmulator.handler(e.target);
});
