package com.company.permgen.webapp.controller;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.DocumentFormat;
import com.artofsolving.jodconverter.DocumentFormatRegistry;
import freemarker.ext.servlet.HttpRequestParametersHashModel;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.jodreports.templates.DocumentTemplate;
import org.jodreports.templates.DocumentTemplateException;
import org.jodreports.templates.DocumentTemplateFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.core.io.Resource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

/**
 * Created by Ski3fter on 01.07.14.
 */
public class DocumentGenerator {

    ApplicationContext applicationContext;

    public DocumentGenerator(ApplicationContext applicationContext,HttpServletRequest request, HttpServletResponse response ) throws Exception {
        this.applicationContext = applicationContext;
    renderDocument(request,response);
    }

    private void renderDocument( HttpServletRequest request, HttpServletResponse response) throws Exception {
        DocumentConverter converter = (DocumentConverter) applicationContext.getBean("documentConverter");
        DocumentFormatRegistry formatRegistry = (DocumentFormatRegistry) applicationContext.getBean("documentFormatRegistry");
        String requestURI = request.getRequestURI();
        if (requestURI.split(".").length ==0 ) {
            requestURI = requestURI+".odt";
        }
        String outputExtension = FilenameUtils.getExtension(requestURI);
        DocumentFormat outputFormat = formatRegistry.getFormatByFileExtension(outputExtension);
        if (outputFormat == null) {
            throw new ServletException("unsupported output format: " + outputExtension);
        }
        File templateFile = null;
        String documentName = FilenameUtils.getBaseName(request.getRequestURI());
        Resource templateDirectory = getTemplateDirectory(documentName);
        if (templateDirectory.exists()) {
            templateFile = templateDirectory.getFile();
        }
        else {
            templateFile = getTemplateFile(documentName).getFile();
            if (!templateFile.exists()) {
                throw new ServletException("template not found: " + documentName);
            }
        }

        DocumentTemplateFactory documentTemplateFactory = new DocumentTemplateFactory();
        DocumentTemplate template = documentTemplateFactory.getTemplate(templateFile);

        ByteArrayOutputStream odtOutputStream = new ByteArrayOutputStream();
        try {

            template.createDocument(new HttpRequestParametersHashModel(request), odtOutputStream);
            Thread.currentThread().sleep(3000) ;
        }
        catch (DocumentTemplateException exception) {
            throw new ServletException(exception);
        }
        response.setContentType(outputFormat.getMimeType());
        response.setHeader("Content-Disposition", "inline; filename=" + documentName + "." + outputFormat.getFileExtension());

        if ("odt".equals(outputFormat.getFileExtension())) {
            // no need to convert
            response.getOutputStream().write(odtOutputStream.toByteArray());
//            response.sendRedirect("controlUsersCustomers");
        }
        else {
            ByteArrayInputStream odtInputStream = new ByteArrayInputStream(odtOutputStream.toByteArray());
            DocumentFormat inputFormat = formatRegistry.getFormatByFileExtension("odt");
            converter.convert(odtInputStream, inputFormat, response.getOutputStream(), outputFormat);
        }
        response.flushBuffer();
    }

    private Resource getTemplateDirectory(String documentName) throws IOException {
        String directoryName = "WEB-INF/templates/" + documentName + "-template";
        return applicationContext.getResource(directoryName);
    }

    private Resource getTemplateFile(String documentName) throws IOException {
        String templateName = "WEB-INF/templates/" + documentName + "-template.odt";
        return applicationContext.getResource(templateName);
    }

}
