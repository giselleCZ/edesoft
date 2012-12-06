


$(document).ready(function () {
    
    $("#btnGuardarActive").click(function () {
        $(".error").remove();
        if ($("#txtsActive_name").val() == "") {
            $("#txtsActive_name").focus().after("<span class='error'>Ingrese su nombre Activo</span>");
            return false;
        } else if ($("#txtsActive_desc").val() == "") {
            $("#txtsActive_desc").focus().after("<span class='error'>Ingrese una Descripcion</span>");
            return false;
        } else if ($("#txtsBarcode").val() == "") {
            $("#txtsBarcode").focus().after("<span class='error'>Ingrese el Codigo de Barras</span>");
            return false;  
        } else if ($("#txtiUtilTime").val() == "") {
            $("#txtiUtilTime").focus().after("<span class='error'>Ingrese pulse el boton para generar la final del activo</span>");
            return false; 
        } else if ($("#txtsBrand").val() == "") {
            $("#txtsBrand").focus().after("<span class='error'>Ingrese la marca</span>");
            return false; 
        }else if ($("#txtsModel").val() == "") {
            $("#txtsModel").focus().after("<span class='error'>Ingrese el modelo</span>");
            return false; 
        }else if ($("#txtsForm").val() == "") {
            $("#txtsForm").focus().after("<span class='error'>Ingrese la forma</span>");
            return false; 
        }else if ($("#txtsSerialNumber").val() == "") {
            $("#txtsSerialNumber").focus().after("<span class='error'>Ingrese el número serial</span>");
            return false; 
        }else if ($("#txtsColor").val() == "") {
            $("#txtsColor").focus().after("<span class='error'>Ingrese el color</span>");
            return false; 
        }else if ($("#txtsCapacity").val() == "") {
            $("#txtsCapacity").focus().after("<span class='error'>Ingrese la capacidad</span>");
            return false; 
        }else if ($("#txtsMaterial").val() == "") {
            $("#txtsMaterial").focus().after("<span class='error'>Ingrese el material</span>");
            return false; 
        }else if ($("#txtiHeihgt").val() == "") {
            $("#txtiHeihgt").focus().after("<span class='error'>Ingrese la altura</span>");
            return false; 
        }else if ($("#txtiWidth").val() == "") {
            $("#txtiWidth").focus().after("<span class='error'>Ingrese el ancho</span>");
            return false; 
        }else if ($("#txtiWide").val() == "") {
            $("#txtiWide").focus().after("<span class='error'>Ingrese el largo</span>");
            return false; 
        }else if ($("#txtiDiameter").val() == "") {
            $("#txtiDiameter").focus().after("<span class='error'>Ingrese el diametro</span>");
            return false; 
        }else if ($("#txtsUnit").val() == "") {
            $("#txtsUnit").focus().after("<span class='error'>Ingrese cantidad</span>");
            return false; 
        }else if ($("#txtiDivNumber").val() == "") {
            $("#txtiDivNumber").focus().after("<span class='error'>Ingrese número de divisiones</span>");
            return false; 
        }else if ($("#txtsAsign_type").val() == "") {
            $("#txtsAsign_type").focus().after("<span class='error'>Ingrese el tipo de asignación</span>");
            return false; 
        }else if ($("#txtsAdquisition_type").val() == "") {
            $("#txtsAdquisition_type").focus().after("<span class='error'>Ingrese el tipo de adquisición</span>");
            return false; 
        }else if ($("#txtdtBuy_time").val() == "") {
            $("#txtdtBuy_time").focus().after("<span class='error'>Ingrese la fecha de compra</span>");
            return false; 
        }else if ($("#txtiBuy_price").val() == "") {
            $("#txtiBuy_price").focus().after("<span class='error'>Ingrese el precio de compra</span>");
            return false; 
        }else if ($("#ddlEstado").val() == "") {
            $("#ddlEstado").focus().after("<span class='error'>Ingrese estado del activo</span>");
            return false; 
        }

    });
    $("#txtsActive_name, #txtsActive_desc, #txtsBarcode, #txtiUtilTime, #txtsBrand, #txtsModel, #txtsForm, #txtsSerialNumber, #txtsColor, #txtsCapacity, #txtsMaterial, #txtiHeihgt,#txtiWidth, #txtiWide, #txtiDiameter, #txtsUnit, #txtsAsign_type, #txtsAdquisition_type, #txtdtBuy_time, #txtiBuy_price ").keyup(function () {
        if ($(this).val() != "") {
            $(".error").fadeOut();
            return false;
        }
    });
   

   
});