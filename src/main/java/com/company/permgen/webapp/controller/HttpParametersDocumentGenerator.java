package com.company.permgen.webapp.controller;

import freemarker.ext.servlet.HttpRequestParametersHashModel;

import javax.servlet.http.HttpServletRequest;

/** A predefined document generator that build the model from the passed HTTP parameters. */
public class HttpParametersDocumentGenerator extends AbstractDocumentGenerator {

    protected Object getModel(HttpServletRequest request) throws Exception {
        return new HttpRequestParametersHashModel(request);
    }
}
