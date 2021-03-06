package com.assignment.bean;

import com.assignment.model.Organization;

import java.util.List;




public interface OrganizationBeanI {

    String add(Organization organization) throws Exception;

    Organization load(int organizationId);

    String delete(int organizationId) throws Exception;

    List<Organization> list();
}
