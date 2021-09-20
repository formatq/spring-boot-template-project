package org.formatq;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.formatq.spring.TemplatedSpringBootApplication;

@SpringBootTest(classes = TemplatedSpringBootApplication.class)
@ActiveProfiles("test")
class SpringBootH2IntegrationTest {

    @Test
    void contextLoads() {
    }
}
