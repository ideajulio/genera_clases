import sqlparse

def sql_to_java_type(sql_type):
    mapping = {
        "int": "int",
        "tinyint": "byte",
        "varchar": "String",
        "datetime": "Date",
        "char": "String",
        "smallint": "int"  # Agregamos mapeo para el tipo smallint
    }
    return mapping.get(sql_type.split('(')[0], "Object")


def extract_table_name(token):
    table_name = ''
    if token.ttype is None and isinstance(token, sqlparse.sql.Identifier):
        table_name_parts = token.get_real_name().split('.')
        table_name = table_name_parts[-1]  # Extraer el nombre de la tabla
    return table_name

def extract_columns(parsed):
    columns = {}
    is_inside_parenthesis = False
    for token in parsed.tokens:
        if isinstance(token, sqlparse.sql.Parenthesis):
            is_inside_parenthesis = True
        elif is_inside_parenthesis and isinstance(token, sqlparse.sql.Identifier):
            column_name = token.get_real_name()
            columns[column_name] = None
        elif isinstance(token, sqlparse.sql.Parenthesis):
            is_inside_parenthesis = False
    return columns


def generate_java_class_content(table_name, columns):
    java_class = f"package snya.cii.modelo;\n\n"
    java_class += "import javax.persistence.*;\n"
    java_class += "import java.util.Date;\n"
    java_class += "import lombok.Data;\n\n"
    java_class += "@Entity\n"
    java_class += f"@Table(name = \"{table_name}\", catalog = \"sistemassnya\")\n"
    java_class += "@Data\n"  # Lombok annotation for getters and setters
    java_class += f"public class {table_name.capitalize()} {{\n"
    for column_name, column_type in columns.items():
        java_class += f"    @Column(name = \"{column_name}\")\n"
        if column_type == "Date":
            java_class += "    @Temporal(TemporalType.TIMESTAMP)\n"
        if column_name.lower() == "idllamado":  # Ajustar a la convención de nombre para la clave primaria
            java_class += "    @Id\n    @GeneratedValue(strategy = GenerationType.IDENTITY)\n"
        
        # Convertir el nombre de la columna a formato camelCase
        property_name = column_name[0].lower() + column_name[1:]
        java_class += f"    private {sql_to_java_type(column_type)} {property_name};\n"
    java_class += "}\n"
    return java_class


def parse_table_definition(table_definition):
    tables = {}
    current_table_name = None
    current_columns = {}
    reserved_keywords = ["constraint", "primary", "key", "unique"]

    for token in table_definition.tokens:
        if isinstance(token, sqlparse.sql.Parenthesis):
            inside_parenthesis = token.value[1:-1]  # Contenido dentro de los paréntesis
            columns_details = inside_parenthesis.split(',')  # Dividir los detalles de las columnas
            for detail in columns_details:
                column_parts = detail.strip().split(maxsplit=1)  # Dividir cada detalle en nombre y tipo
                if len(column_parts) >= 2:  # Asegurar que hay al menos dos partes
                    column_name = column_parts[0]
                    column_type_part = column_parts[1].split()[0]  # Tipo de dato SQL, ignorando longitud
                    if column_name.lower() not in reserved_keywords and not column_name.startswith('['):  
                        # Evitar incluir palabras reservadas como propiedad y evitar los que comienzan con '['
                        current_columns[column_name] = column_type_part
                        #print(f"Columna extraída: {column_name} - Tipo: {column_type_part}")
        elif isinstance(token, sqlparse.sql.Identifier):
            table_name = extract_table_name(token)
            if table_name:
                #print(f"Nombre de la tabla: {table_name}")
                current_table_name = table_name
                current_columns = {}
    if current_table_name:
        tables[current_table_name] = {'columns': current_columns}
        #print(f"Columnas extraídas de la última tabla: {current_columns}")

    return tables



def generate_table_classes(statements):
    java_classes = []
    all_fields = {}

    for statement in statements:
        try:
            parsed = sqlparse.parse(statement)[0]
            tables = parse_table_definition(parsed)
            for table_name, table_data in tables.items():
                class_content = generate_java_class_content(table_name, table_data['columns'])
                java_classes.append((table_name.capitalize(), class_content))
                all_fields[table_name] = list(table_data['columns'].keys())
        except Exception as e:
            print(f"Error al generar clase Java para la tabla {table_name}: {str(e)}")

    return java_classes, all_fields
