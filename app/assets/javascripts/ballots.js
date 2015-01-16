$( document ).ready(function () {
 // $("#ballot_pm_speaks").val(Math.round($("#ballot_pm_speaks").val()*10)/10)
 // $("#ballot_mg_speaks").val(Math.round($("#ballot_mg_speaks").val()*10)/10)
 // $("#ballot_lo_speaks").val(Math.round($("#ballot_lo_speaks").val()*10)/10)
 // $("#ballot_mo_speaks").val(Math.round($("#ballot_mo_speaks").val()*10)/10)
  $(".round").each(function(i, el){
    $(el).val(Math.round($(el).val()*10)/10)
  })

})