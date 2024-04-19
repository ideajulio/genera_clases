import os
import sqlparse
from modelo import generate_table_classes
from generar_clases import write_java_classes
from parametria import generate_crud_jsp_file

def main():
    output_dir = "D:\\workspace-python\\genera_clases"
    input_file = "D:\\workspace-python\\genera_clases\\tablas.sql"
    try:
        with open(input_file, 'r') as file:
            sql_script = file.read()

        statements = sqlparse.split(sql_script)
        java_classes, fields = generate_table_classes(statements)  # Modificado para obtener 'fields' también
        print("Campos:", fields)  # Agregamos esta impresión para verificar los campos obtenidos

        write_java_classes(java_classes, output_dir, fields)  # Pasar 'fields' como argumento adicional

        for table_name, table_fields in fields.items():
            print(f"Generando JSP para la tabla {table_name} con campos: {table_fields}")  # Agregamos esta impresión
            generate_crud_jsp_file(table_name, output_dir, table_fields)  # Pasar los campos específicos de cada tabla a generate_crud_jsp_file

        #print(f"Se generaron {len(java_classes)} clases Java con éxito.")
    except Exception as e:
        print(f"Error: {str(e)}")


if __name__ == "__main__":
    main()
