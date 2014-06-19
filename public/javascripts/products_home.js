
$(document).ready(function()
{
  $('.divImagen').hover(

    // función que se ejecutará cuando el mouse se pose sobre algún divImagen
    function() {

        // es muy importante utilizar la función stop() para que la animación
        // no se ejecute constantemente (si pasamos muchas veces seguidas por el elemento)
        $(this).find('img').stop().animate({ 

            width:100, // reducimos el tamaño de la imagen
            marginTop:10,
            marginLeft:10
            }, 500);
    },

    // función se se ejecutará cuando el mouse deje el elemento
    function() {
      $(this).find('img').stop().animate({

        width:800, // devolvemos la imagen a su tamaño real
        marginTop:0,
        marginLeft:0
      },300);
    }
  );
});