$(function(){




$('.ingredient').on('click', function (e){
  e.preventDefault();
  $(this).attr("data-id");
  console.log($(this).attr("data-id"));
});

})
