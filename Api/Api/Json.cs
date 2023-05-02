using Api.Modelos;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace AppApi
{
    public class JSON
    {
       //en caso de que no tenga la base de datos puede usar los datos que estan en Pelis.json

        public static string Post(List<Movie> pelis1)
        {
            string ruta = $"Pelis.json";
            string mensaje = "datos guardados";

            if (pelis1 == null)
            {
                mensaje = "objeto vacio";
            }

            List<Movie> dato = new List<Movie>();

            if (System.IO.File.Exists(ruta))
            {
                string existe = System.IO.File.ReadAllText(ruta);
                dato = JsonConvert.DeserializeObject<List<Movie>>(existe);

            }
            else 
            {
            File.Create(ruta);
             string existe = System.IO.File.ReadAllText(ruta);
             dato = JsonConvert.DeserializeObject<List<Movie>>(existe);

            }


            foreach (var pelis in pelis1)
            {
                Movie peli = new Movie()
                {
                    Id = pelis.Id,
                    Titulo = pelis.Titulo,
                    Fecha = pelis.Fecha,
                    Imagen = ruta,
                };

                dato.Add(peli);

            }

            string datos = System.Text.Json.JsonSerializer.Serialize(dato);

            System.IO.File.WriteAllText(ruta, datos);


            return mensaje;

        }


        public static dynamic Put(int id, Movie cliente)
        {
            string ruta = $"Pelis.json";

            string mensaje = "El Cliente no se encontro";

            string json = System.IO.File.ReadAllText(ruta);
            JArray arrayObjetos = JsonConvert.DeserializeObject<JArray>(json);

            JToken objetoBuscado = null;

            foreach (JObject objeto in arrayObjetos)
            {

                if ((int)objeto["id"] == id)
                {
                    objetoBuscado = objeto;
                    objeto["id"] = cliente.Id;
                    objeto["titulo"] = cliente.Titulo;
                    objeto["imagen"] = cliente.Imagen;
                    objeto["fecha"] = cliente.Fecha;

                    mensaje = "Cliente Actualizado";
                    break;
                }
            }



            string jsonModificado = JsonConvert.SerializeObject(arrayObjetos);
            System.IO.File.WriteAllText(ruta, jsonModificado);

            return mensaje;
        }

        public static dynamic DeleteId(int id)
        {
            string ruta = $"Pelis.json";

            string mensaje = "El Cliente no se encontro";

            string json = System.IO.File.ReadAllText(ruta);
            JArray arrayObjetos = JsonConvert.DeserializeObject<JArray>(json);

            JToken objetoBuscado = null;

            foreach (JToken objeto in arrayObjetos)
            {
                if ((int)objeto["id"] == id)
                {
                    objetoBuscado = objeto;
                    break;
                }
            }

            if (objetoBuscado != null)
            {
                objetoBuscado.Remove();
                mensaje = "Pelicula eliminada";
            }

            string jsonModificado = JsonConvert.SerializeObject(arrayObjetos);
            System.IO.File.WriteAllText(ruta, jsonModificado);


            return mensaje;
        }



        public static List<Movie> Get()
        {

            string ruta = $"Pelis.json";

            if (System.IO.File.Exists(ruta))
            {
                string existe = System.IO.File.ReadAllText(ruta);
                var lista = JsonConvert.DeserializeObject<List<Movie>>(existe);
                return lista;
            }
            else
            {



                List<Movie> datoEjemplo = new List<Movie>();


                return datoEjemplo;
            }


        }
    }



}



