$( document ).ready(function () {
 // $("#ballot_pm_speaks").val(Math.round($("#ballot_pm_speaks").val()*10)/10)
 // $("#ballot_mg_speaks").val(Math.round($("#ballot_mg_speaks").val()*10)/10)
 // $("#ballot_lo_speaks").val(Math.round($("#ballot_lo_speaks").val()*10)/10)
 // $("#ballot_mo_speaks").val(Math.round($("#ballot_mo_speaks").val()*10)/10)
  function round_tenth(n) {
    return (Math.round(n*10)/10)
  }

  $(".round").each(function(i, el){
    $(el).val(round_tenth($(el).val))
  })


  function sum_speaks(){
    var gov_speaks = round_tenth(Number($("#ballot_pm_speaks").val()) +
                                 Number($("#ballot_mg_speaks").val()))
    $("#gov-total-speaks").text(String(gov_speaks))
    var opp_speaks = round_tenth(Number($("#ballot_lo_speaks").val()) +
                                 Number($("#ballot_mo_speaks").val()))
    $("#opp-total-speaks").text(String(opp_speaks))
  }

  $("#ballot_pm_speaks, #ballot_mg_speaks, #ballot_lo_speaks, #ballot_mo_speaks").change(function(e){
    sum_speaks()
  })

  sum_speaks()
})