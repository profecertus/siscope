package pe.com.isesystem.gpservice.configuration;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RespuestaHttp {
    private Object valorDevuelto;
}
