using Api.Modelos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;

namespace AppApi.Controllers
{
    public class EntityController : Controller
    {
        public PelisContext context { get;}
        public EntityController(PelisContext peli) 
        {
        
            context = peli;
        }

        [HttpGet("Get")]
        public ActionResult Get()
        {
            return Ok(context.Movies.ToList());
        }


        [HttpGet("Get/{id}")]
        public ActionResult GetId(int id)
        {

            var mensaje ="No se encontro Pelicula con este Id: " + id;
            try
            {
                var list = from d in context.Movies where d.Id == id select d;

                if (list.Count() > 0)
                {

                    return Ok(list);
                }
            }
            catch (Exception ex)
            {

                mensaje = "Error en obtener los datos: " + ex.Message;
            }

            return Ok(mensaje);
        }


        [HttpPost("Save")]
        public ActionResult Post(Movie pelis)
        {
            string mensaje = "Pelicula Guardada con exito";

       


            Movie peli = new Movie()
            {
                Id = pelis.Id,
                Titulo = pelis.Titulo,
                Fecha = pelis.Fecha,
                Imagen = pelis.Imagen,
            };




            try
            {
                context.Movies.Add(peli);
                context.SaveChanges();

            }
            catch (Exception ex)
            {
                mensaje = "Ocurrio un error revise la base de datos: \n " + ex.Message;

            }


            return Ok(mensaje);
        }


        [HttpPut("Update")]
        public ActionResult Put(Movie peli)
        {
            string mensaje = "La pelicula no se encontro";
            var tabla1 = context.Movies.ToList();
            



            for (int i = 0; i < tabla1.Count; i++)
            {

                if (tabla1[i].Id == peli.Id)
                {

                    tabla1[i].Titulo = peli.Titulo == null ? tabla1[i].Titulo : peli.Titulo;
                    tabla1[i].Fecha = peli.Fecha == null ? tabla1[i].Fecha : peli.Fecha;
                    tabla1[i].Imagen = peli.Imagen == null ? tabla1[i].Imagen : peli.Imagen;


                    context.SaveChanges();
                    mensaje = $"La pelicula: {peli.Titulo} fue actualizada";
                }


            }

            return Ok(mensaje);
        }


        [HttpDelete("Delete")]
        public ActionResult Delete(int id)
        {
            string mensaje = "la pelicula se elimino con exito";

            try
            {
                foreach (var item in context.Movies)
                {
                    if (item.Id == id)
                    {
                        context.Movies.Remove(item);
                        context.SaveChanges();

                    }
                    else
                    {
                        mensaje = "La pelicula con el id: " + id + " no se encontro";
                    }

                }


            }
            catch (Exception ex)
            {
                mensaje = "Ocurrio un error =>  " + ex.Message;

            }


            return Ok(mensaje);
        }





       


    }
}
