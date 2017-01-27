$( document ).ready(function () {
 // $("#ballot_pm_speaks").val(Math.round($("#ballot_pm_speaks").val()*10)/10)
 // $("#ballot_mg_speaks").val(Math.round($("#ballot_mg_speaks").val()*10)/10)
 // $("#ballot_lo_speaks").val(Math.round($("#ballot_lo_speaks").val()*10)/10)
 // $("#ballot_mo_speaks").val(Math.round($("#ballot_mo_speaks").val()*10)/10)

  /*is rounding still needed in new model?*/
  function round_hundreth(n) {
    return n;//(Math.round(n*100)/100)
  }

  // $(".round").each(function(i, el){
  //   $(el).val(round_tenth($(el).val))
  // })

  function sum_speaks(){
    var gov_speaks = round_hundreth(Number($("#ballot_pm_speaks").val()) +
                                 Number($("#ballot_mg_speaks").val()))
    $("#gov-total-speaks").text(String(gov_speaks))
    var opp_speaks = round_hundreth(Number($("#ballot_lo_speaks").val()) +
                                 Number($("#ballot_mo_speaks").val()))
    $("#opp-total-speaks").text(String(opp_speaks))
  }

  $("#ballot_pm_speaks, #ballot_mg_speaks, #ballot_lo_speaks, #ballot_mo_speaks").change(function(e){
    sum_speaks()
  })

  sum_speaks()

  // $('#edit_ballot').on('submit', function(e) {
  //   e.preventDefault()
  //   console.log("here")
  //   var gov_id = Number($("#gov").val())
  //   var opp_id = Number($("#opp").val())
  //   var gov_total_speaks = Number($("#gov-total-speaks").text())
  //   var opp_total_speaks = Number($("#opp-total-speaks").text())
  //   console.log(gov_total_speaks, opp_total_speaks)
  //   var winner_id = Number($("#ballot_winner_id").val())
  //   if (winner_id == gov_id) {
  //     if (gov_total_speaks < opp_total_speaks){

  //       return false;
  //     }
  //   } else {

  //   }
  //   $('#edit_ballot').submit()
  // })

})
;
