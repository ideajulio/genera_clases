import os
from datos import generate_dao_class_content, generate_dao_impl_class_content
from servicio import generate_servicio_impl_class_content
from parametria import generate_crud_jsp_file


def write_java_classes(java_classes, output_dir, fields):  # Modificar la definición de la función
    src_dir = os.path.join(output_dir, "src")

    try:
        if not os.path.exists(src_dir):
            os.makedirs(src_dir, exist_ok=True)

        output_datos = os.path.join(src_dir, "datos")
        output_servicio = os.path.join(src_dir, "servicio")
        output_parametria = os.path.join(src_dir, "parametria")
        output_modelo = os.path.join(src_dir, "modelo")  # Directorio principal para las clases de modelo

        if not os.path.exists(output_datos):
            os.makedirs(output_datos, exist_ok=True)

        if not os.path.exists(output_servicio):
            os.makedirs(output_servicio, exist_ok=True)

        if not os.path.exists(output_parametria):
            os.makedirs(output_parametria, exist_ok=True)

        if not os.path.exists(output_modelo):
            os.makedirs(output_modelo, exist_ok=True)

        for class_name, class_content in java_classes:
            # Generar archivo de clase en el directorio principal
            class_file_path = os.path.join(output_modelo, f"{class_name}.java")
            with open(class_file_path, 'w') as class_file:
                class_file.write(class_content)
            #print(f"Archivo generado para la clase {class_name}: {class_file_path}")

            # Generar archivo DAO en la carpeta "datos"
            dao_file_content = generate_dao_class_content(class_name)
            dao_file_path = os.path.join(output_datos, f"{class_name}DAO.java")
            with open(dao_file_path, 'w') as dao_file:
                dao_file.write(dao_file_content)
            #print(f"Archivo DAO generado para la clase {class_name}: {dao_file_path}")

            # Generar archivo DAOImpl en la carpeta "datos"
            impl_file_content = generate_dao_impl_class_content(class_name)
            impl_file_path = os.path.join(output_datos, f"{class_name}DAOImpl.java")
            with open(impl_file_path, 'w') as impl_file:
                impl_file.write(impl_file_content)
            #print(f"Archivo DAOImpl generado para la clase {class_name}: {impl_file_path}")

            # Generar archivo ServicioImpl en la carpeta "servicio"
            servicio_impl_content = generate_servicio_impl_class_content(class_name)
            servicio_impl_path = os.path.join(output_servicio, f"{class_name}ServicioImpl.java")
            with open(servicio_impl_path, 'w') as servicio_impl_file:
                servicio_impl_file.write(servicio_impl_content)
            #print(f"Archivo ServicioImpl generado para la clase {class_name}: {servicio_impl_path}")

            # Generar archivo JSP CRUD en la carpeta "parametria"
            generate_crud_jsp_file(class_name, output_dir,fields)  # Pasar 'fields' como argumento adicional

    except Exception as e:
        print(f"Error al escribir archivos Java: {str(e)}")
