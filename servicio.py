def generate_servicio_impl_class_content(table_name):
    servicio_impl_content = f"package snya.cii.servicio;\n\n"
    servicio_impl_content += f"public class {table_name.capitalize()}ServicioImpl {{\n"
    servicio_impl_content += f"    // Implementación de métodos de servicio para la entidad {table_name}\n"
    servicio_impl_content += "}\n"
    return servicio_impl_content


