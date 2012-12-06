//validacion para Localidades
$(document).ready(function () {
    var depreg = /^[0-9]+$/;
    $("#btGuardarlocalidad").click(function () {
        $(".error").remove();
        if ($("#txtnombre").val() == "") {
            $("#txtnombre").focus().after("<span class='error'>Ingrese el nombre Localidad</span>");
            return false;
        } else if ($("#txtdesc").val() == "") {
            $("#txtdesc").focus().after("<span class='error'>Ingrese una descripción Localidad</span>");
            return false;
        }
    });
    $("#txtnombre, #txtdesc").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });


});



$(document).ready(function () {
    var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    $("#btGuardarproveedor").click(function () {
        $(".error").remove();
        if ($("#txtnombre").val() == "") {
            $("#txtnombre").focus().after("<span class='error'>Ingrese su nombre</span>");
            return false;
        } else if ($("#txtrs").val() == "") {
            $("#txtrs").focus().after("<span class='error'>Ingrese una Razón Social</span>");
            return false;
        } else if ($("#txttelefono").val()=="") {
            $("#txttelefono").focus().after("<span class='error'>Ingrese el teléfono debe tener 8 carcteres </span>");
            return false;
        } else if ($("#txtmail").val() == "" || !emailreg.test($("#txtmail").val())) {
            $("#txtmail").focus().after("<span class='error'>Ingrese un Email correcto</span>");
            return false;
        } else if ($("#txtdireccion").val() == "") {
            $("#txtdireccion").focus().after("<span class='error'>Ingrese la dirección</span>");
            return false;
        }
    });
    $("#txtnombre, #txtrs, #txttelefono, #txtdireccion").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });

    $("#txtmail").keyup(function () {
        if ($(this).val() != "" && emailreg.test($(this).val())) {
            $(".error").fadeOut();
            return false;
        }
    });
});


