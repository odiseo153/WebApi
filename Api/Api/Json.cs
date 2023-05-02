using Api.Modelos;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace AppApi
{
    public class Json
    {
       

        public static string Post(List<Movie> pelis1)
        {
            string ruta = $"C:\\Users\\{Environment.UserName}\\Desktop\\Pelis.json";
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
            string url = $"C:\\Users\\{Environment.UserName}\\Desktop\\Pelis.json";

            string mensaje = "El Cliente no se encontro";

            string json = System.IO.File.ReadAllText(url);
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
            System.IO.File.WriteAllText(url, jsonModificado);

            return mensaje;
        }

        public static dynamic DeleteId(int id)
        {
            string url = $"C:\\Users\\{Environment.UserName}\\Desktop\\Pelis.json";

            string mensaje = "El Cliente no se encontro";

            string json = System.IO.File.ReadAllText(url);
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
            System.IO.File.WriteAllText(url, jsonModificado);


            return mensaje;
        }



        public static List<Movie> Get()
        {

            string ruta = $"C:\\Users\\{Environment.UserName}\\Desktop\\Pelis.json";

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



