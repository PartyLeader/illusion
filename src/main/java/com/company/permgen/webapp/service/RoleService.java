package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Role;
import com.company.permgen.webapp.model.Size;
import com.company.permgen.webapp.repository.RoleRepository;
import com.company.permgen.webapp.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/19/14
 * Time: 12:20 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class RoleService {
    @Autowired
    protected RoleRepository repository;

    public List<Role> getRole() {
        return repository.getRole();
    }
    public void createRole(Role role) {
        repository.createRole(role);
    }
    public void updateRole(Role role) {
        repository.updateRole(role);
    }
    public Role getRoleById(int id) {
        return repository.getRoleById(id);
    }
}
