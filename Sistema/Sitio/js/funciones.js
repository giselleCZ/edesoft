//validacion para familias
$(document).ready(function () {
    var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
    var depreg=/^[0-9]+$/;
    $("#btnGuardarFamilies").click(function () {
		$(".error").remove();
		if ($("#txtFamily_name").val() == "") {
		    $("#txtFamily_name").focus().after("<span class='error'>Ingrese el nombre para la familia</span>");
			return false;
            } else if ($("#txtFamily_desc").val() == "" ) {
                $("#txtFamily_desc").focus().after("<span class='error'>Ingrese una descripcion</span>");
			            return false;
            } else if ($("#txtDepreciation").val() == "" || !depreg.test($("#txtDepreciation").val())) {
                $("#txtDepreciation").focus().after("<span class='error'>Ingrese una cantidad en meses</span>");
			return false;
		    }
	    });
		$("#txtFamily_name, #txtFamily_desc, #txtDepreciation").keyup(function () {
				if( $(this).val() != "" ){
					$(".error").fadeOut();			
					return false;
				}		
			});
		$("#txtDepreciation").keyup(function () {
				if( $(this).val() != "" && depreg.test($(this).val())){
					$(".error").fadeOut();			
					return false;
				}		
			});
});
//validacion para SubFamilias
$(document).ready(function () {
    var depreg = /^[0-9]+$/;
    $("#btnGuardarSFamily").click(function () {
        $(".error").remove();
        if ($("#txtSubfamily_name").val() == "") {
            $("#txtSubfamily_name").focus().after("<span class='error'>Ingrese un Nombre para la Sub Familia</span>");
            return false;
        } 
    });
    $("#txtSubfamily_name").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });
});

//validacion para roles

$(document).ready(function () {
    var depreg = /^[0-9]+$/;
    $("#btnGuardarRols").click(function () {
        $(".error").remove();
        if ($("#txtRol").val() == "") {
            $("#txtRol").focus().after("<span class='error'>Ingrese el nombre para el Rol</span>");
            return false;
        } 
    });
    $("#txtRol").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });
    $("#txtRol").keyup(function () {
        if ($(this).val()) {
            $(".error").fadeOut();
            return false;
        }
    });
});

//validacion para responsables
$(document).ready(function () {
    var depreg = /^[0-9]+$/;
    $("#btnGuardarResponsibles").click(function () {
        $(".error").remove();
        if ($("#txtCi").val() == "") {
            $("#txtCi").focus().after("<span class='error'>Ingrese el Numero de Cedula de Identidad</span>");
            return false;
        } else if ($("#txtFName").val() == "") {
            $("#txtFName").focus().after("<span class='error'>Ingrese el Nombre</span>");
            return false;
        } else if ($("#txtLName").val() == "") {
            $("#txtLName").focus().after("<span class='error'>Ingrese un Apellido</span>");
            return false;
        } else if ($("#txtStartdate").val() == "") {
            $("#txtStartdate").focus().after("<span class='error'>Ingrese una Fecha de Inicio</span>");
            return false;
        } else if ($("#txtEnddate").val() == "") {
            $("#txtEnddate").focus().after("<span class='error'>Ingrese una Fecha de Conclucion</span>");
            return false;
        }
    });
    $("#txtCi, #txtFName, #txtLName, #txtStartdate, #txtEnddate").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });
});
//validacion para centro de costos
$(document).ready(function () {
    var depreg = /^[0-9]+$/;
    $("#btguardar").click(function () {
        $(".error").remove();
        if ($("#txtNombrecc").val() == "") {
            $("#txtNombrecc").focus().after("<span class='error'>Ingrese el nombre para centro de costo</span>");
            return false;
        } else if ($("#txtDesccc").val() == "") {
            $("#txtDesccc").focus().after("<span class='error'>Ingrese una descripcion</span>");
            return false;
        } else if ($("#txtGestioncc").val() == "" || !depreg.test($("#txtGestioncc").val())) {
            $("#txtGestioncc").focus().after("<span class='error'>Ingrese una cantidad en numeros</span>");
            return false;
        }
    });
    $("#txtNombrecc, #txtDesccc, #txtGestioncc").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });
    $("#txtGestioncc").keyup(function () {
        if ($(this).val() != "" && depreg.test($(this).val())) {
            $(".error").fadeOut();
            return false;
        }
    });
});

