using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Api.Modelos
{
    public partial class Movie
    {
        public int Id { get; set; }
        public string? Titulo { get; set; }
        public string? Descripcion { get; set; }
        public string? Imagen { get; set; }
        public string? Fecha { get; set; }

        [NotMapped]
        public IFormFile LaImagen { get; set; }
    }
}
