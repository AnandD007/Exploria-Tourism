$(document).ready(function() {
  $(".add-row").click(function() {
      var name = $("#name").val();
      var email = $("#email").val();
      var markup = "<tr><td class='text-center w-3x pt-2'><input type='checkbox' /></td><td><div class='form-group mb-1'><select class='custom-select custom-select-sm tbl-wfx kot-table font-sm'><option value='1' selected>-- Select Product --</option><option value='1'>Cheese Burger</option><option value='2'>Cheese Pizza</option></select></div></td><td class='w-10x'><div class='form-group mb-1'><input class='form-control form-control-sm font-sm' type='number' step='1' min='1' /></div></td><td class='w-10x'><div class='form-group mb-1'><select class='custom-select custom-select-sm font-sm'><option value selected>select</option><option value>FULL</option><option value>HALF</option></select></div></td><td class='w-10x'><div class='form-group mb-1'><input class='form-control form-control-sm font-sm' type='text' /></div></td><td class='w-10x'><div class='form-group mb-1'><input class='form-control form-control-sm font-sm' type='text' /></div></td></tr>";
      $(".kot-table tbody").append(markup);
  });
  /* Find and remove selected table rows */
  $(".delete-row").click(function() {
      $(".kot-table tbody").find('input[name="record"]').each(function() {
          if ($(this).is(":checked")) {
              $(this).parents("tr").remove();
          }
      });
  }); 
});