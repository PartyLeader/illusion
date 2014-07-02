package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Good;
import com.company.permgen.webapp.model.Product;
import com.company.permgen.webapp.repository.GoodRepository;
import com.company.permgen.webapp.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 802140 on 01.07.2014.
 */
@Service
public class ProductService {

    @Autowired
    protected ProductRepository repository;

    public List<Product> getProduct() {
        return repository.getProduct();
    }

    public void createProduct(Product product) {
        repository.createProduct(product);
    }
    public void updateProduct(Product product) {
        repository.updateProduct(product);
    }


}