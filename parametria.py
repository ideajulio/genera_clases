import os
from datos import generate_dao_class_content, generate_dao_impl_class_content
from servicio import generate_servicio_impl_class_content


def generate_crud_jsp_file_content(table_name, fields):
    # Capitalizar cada palabra en el nombre de la tabla
    capitalized_table_name = ''.join(word.capitalize() for word in table_name.split('_'))

    # Construir el nombre del archivo JSP respetando el formato
    jsp_file_name = f"crud{capitalized_table_name}.jsp"
    
    # Directorio donde se guardarán los archivos JSP
    jsp_directory = "D:/workspace-python/genera_clases/src/parametria"
    
    # Verificar si el directorio existe y, si no, crearlo
    if not os.path.exists(jsp_directory):
        os.makedirs(jsp_directory)
    
    # Construir la ruta completa al archivo JSP
    full_jsp_path = os.path.join(jsp_directory, jsp_file_name)

    # Construir el contenido del archivo JSP
    jsp_content = f"<!DOCTYPE html>\n"
    jsp_content += f"<html>\n"
    jsp_content += f"<head>\n"
    jsp_content += f"    <title>CRUD {capitalized_table_name}</title>\n"
    jsp_content += f"</head>\n"
    jsp_content += f"<body>\n"
    jsp_content += f"    <h1>CRUD Operations for {capitalized_table_name}</h1>\n"
    
    if fields:  # Verificar si hay campos disponibles
        #print("Generando formulario con campos:")
        for field in fields:
            print(f"Campo: {field}")
        jsp_content += f"    <form action=\"/create\" method=\"post\">\n"
        # Agregar campos del formulario
        for field in fields:
            jsp_content += f"        <label for=\"{field}\">{field.capitalize()}</label>\n"
            jsp_content += f"        <input type=\"text\" id=\"{field}\" name=\"{field}\"><br>\n"
        # Agregar botón de envío
        jsp_content += f"        <input type=\"submit\" value=\"Submit\">\n"
        jsp_content += f"    </form>\n"
    else:
        jsp_content += f"    <p>No fields available for this table.</p>\n"
    
    jsp_content += f"</body>\n"
    jsp_content += f"</html>\n"

    # Escribir el contenido en el archivo JSP
    with open(full_jsp_path, "w") as jsp_file:
        jsp_file.write(jsp_content)

    return full_jsp_path

def generate_crud_jsp_file(table_name, output_dir, fields):
    try:
        formatted_table_name = ''.join(word.capitalize() for word in table_name.split('_'))

        file_content = f"<!DOCTYPE html>\n"
        file_content += f"<html>\n<head>\n"
        file_content += f"<title>CRUD {formatted_table_name}</title>\n"
        file_content += f"</head>\n<body>\n"
        file_content += f"<h1>CRUD Operations for {formatted_table_name}</h1>\n"
        file_content += "<form action='save_data.jsp' method='post'>\n"

        print(f"Campos para la tabla {formatted_table_name}: {fields}")  # Agregamos una impresión para verificar los campos

        for field in fields:
            file_content += f"<label for='{field}'>{field.capitalize()}: </label>\n"
            file_content += f"<input type='text' id='{field}' name='{field}'><br>\n"

        file_content += "<input type='submit' value='Submit'>\n"
        file_content += "</form>\n"
        file_content += f"</body>\n</html>\n"

        output_parametria = os.path.join(output_dir, "src", "parametria")  # Corregimos la construcción de la ruta

        if not os.path.exists(output_parametria):
            os.makedirs(output_parametria, exist_ok=True)

        file_path = os.path.join(output_parametria, f"crud{formatted_table_name}.jsp")
        print(f"Ruta del archivo JSP: {file_path}")  # Impresión para verificar la ruta del archivo

        with open(file_path, 'w') as jsp_file:
            jsp_file.write(file_content)
            print(f"Archivo JSP CRUD generado para la tabla {formatted_table_name}: {file_path}")

    except Exception as e:
        print(f"Error al generar el archivo JSP CRUD para la tabla {formatted_table_name}: {str(e)}")
