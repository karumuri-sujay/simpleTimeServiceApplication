package com.particle41.simpleTimeService.SimpleTimeService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

/**
 * @author Sujay
 */

@RestController
public class JsonApplication {

    @GetMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getJson(HttpServletRequest request) {
        String ipAddress = request.getRemoteAddr();
        String timeStamp = Instant.now().toString();
        return """
                {
                    \"timestamp\": \"%s\",
                    \"ip\": \"%s\"
                }
                """.formatted(timeStamp, ipAddress);
    }
}
