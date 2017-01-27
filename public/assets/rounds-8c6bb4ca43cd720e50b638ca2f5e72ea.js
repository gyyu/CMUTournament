$( document ).ready(function () {

  $(".nav-tabs li").click(function(e) {
    e.preventDefault()
    $(".tab-pane").each(function(i, el) {
      $(el).removeClass("active")
    })
    $($(this)[0].id+".tab-pane").each(function(i, el) {
      $(el).addClass("active")
    })

  })

})

;
