//package cn.edu.scu.platform.configuration;
//
//
//import freemarker.template.TemplateModelException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Configuration;
//
//import javax.annotation.PostConstruct;
//import javax.servlet.ServletContext;
//
//@Configuration
//public class FreeMarkerConfiguration {
//    @Value("${contextPath}")
//    private String contextPath;
//    @Autowired
//    private freemarker.template.Configuration configuration;
//
//    @PostConstruct
//    public void setVariableConfiguration() throws TemplateModelException {
//        configuration.setSharedVariable("contextPath", contextPath);
//    }
//
//}
