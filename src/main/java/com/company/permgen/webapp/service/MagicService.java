package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Magic;
import com.company.permgen.webapp.repository.MagikRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/19/14
 * Time: 11:23 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class MagicService{
@Autowired
protected MagikRepository repository;

        public List<Magic> getMagic() {
            return repository.getMagic();
        }
        public void createMagic(Magic item) {
            repository.createMagic(item);
        }
        public void updateMagic(Magic item) {
            repository.updateMagic(item);
        }

}
