package ec.edu.uteq.facturacion.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI facturacionOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Sistema de Facturacion API")
                        .description("API REST con acceso hibrido a datos: CRUD elementales via JPA y operaciones complejas via procedimientos almacenados.")
                        .version("v1.0.0")
                        .contact(new Contact()
                                .name("Facultad de Ciencias de la Computacion y Diseno Digital - UTEQ")
                                .email("fccdd@uteq.edu.ec"))
                        .license(new License()
                                .name("Apache 2.0")
                                .url("https://www.apache.org/licenses/LICENSE-2.0")));
    }
}
