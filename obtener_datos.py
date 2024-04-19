def generate_dao_class_content(table_name):
    dao_class_content = f"package snya.cii.datos;\n\n"
    dao_class_content += f"public interface {table_name}DAO {{\n"
    dao_class_content += "}\n"
    return dao_class_content

def generate_dao_impl_class_content(table_name):
    impl_class_content = f"package snya.cii.datos;\n\n"
    impl_class_content += f"public class {table_name}DAOImpl implements {table_name}DAO {{\n"
    impl_class_content += "}\n"
    return impl_class_content
