using Api.Modelos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;

namespace AppApi
{
    public class EntityFrameWork
    {
        public static PelisContext context;
        
        public EntityFrameWork() 
        {
        
        }


        public EntityFrameWork(PelisContext nm)
        {
            context = nm;
        }

        public static List<Movie> Get() 
        {
        return  context.Movies.ToList();
        }

        public static dynamic GetId(int id) 
        {

            try
            {
                var list = from d in context.Movies where d.Id == id select d;

                if (list.Count() > 0)
                {

                    return list;
                }
            }
            catch (Exception ex)
            {

                return "Error en obtener los datos: "+ex.Message;
            }

            return "No se encontro Pelicula con este Id: " + id;
        }

        public static string Post(Movie pelis)
        {
            string mensaje = "Pelicula Guardada con exito";

            string ruta = Ruta(pelis.LaImagen);
              

                Movie  peli = new Movie()
                {
                    Id = pelis.Id,
                    Titulo = pelis.Titulo,
                    Fecha = pelis.Fecha,
                    Imagen = ruta,
                };

     

            
            try {
                context.Movies.Add(peli);
                context.SaveChanges();

            }
            catch(Exception ex) { 
            mensaje = "Ocurrio un error revise la base de datos: \n "+ex.Message;
            
            }

            
            return mensaje; 
        }

        public static string Put([FromForm] Movie peli)
        {
            string mensaje = "La pelicula no se encontro";
            var tabla1 = context.Movies.ToList();
            string ruta = Ruta(peli.LaImagen);



            for (int i = 0; i < tabla1.Count; i++)
            {

                if (tabla1[i].Id == peli.Id)
                {

                    tabla1[i].Titulo = peli.Titulo == null ? tabla1[i].Titulo : peli.Titulo;
                    tabla1[i].Fecha = peli.Fecha == null ? tabla1[i].Fecha : peli.Fecha;
                    tabla1[i].Imagen = peli.Imagen == null ? tabla1[i].Imagen : ruta;


                    context.SaveChanges();
                    mensaje = $"La pelicula: {peli.Titulo} fue actualizada";
                }


            }

            return mensaje;
        }

        public static string DeleteId(int id) 
        {
            string mensaje = "la pelicula se elimino con exito";

            try {
                foreach (var item in context.Movies)
                {
                    if (item.Id == id)
                    {
                        context.Movies.Remove(item);
                        context.SaveChanges();

                    }
                    else 
                    {
                        mensaje = "La pelicula con el id: "+id+" no se encontro";
                    }

                }


            }
            catch (Exception ex) {
            mensaje = "Ocurrio un error =>  " +ex.Message;
            
            }


            return mensaje;
        
        }


        public static dynamic Ruta(IFormFile file)
        {
            string ruta = $"C:\\Users\\{Environment.UserName}\\Desktop\\Proyecto Final\\Fronted\\Peliculas\\image";


            if (!Directory.Exists(ruta))
            {
                Directory.CreateDirectory(ruta);
            }

            var contenido = ContentDispositionHeaderValue.Parse(file.ContentDisposition);
            var nom = file.FileName;
            var path = Path.Combine(ruta, nom);

            using (var stream = new FileStream(path, FileMode.Create))
            {
                file.CopyToAsync(stream);
            }

            string lugar = "/image" + $"/{nom}";

            return lugar;
        }
    }

        
}
