using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Api.Modelos
{
    public partial class Movie
    {
        //Representacion a modo de clase de la tabla Movie con sus atributos
        [Key]
        public int Id { get; set; }
        public string? Titulo { get; set; }
        public string? Descripcion { get; set; }
        public string? Imagen { get; set; }
        public string? Fecha { get; set; }


    }
}
