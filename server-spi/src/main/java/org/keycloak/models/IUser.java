package org.keycloak.models;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

public interface IUser {

    String getUsername();

    void setUsername(String username);

    void setSingleAttribute(String name, String value);

    void setAttribute(String name, List<String> values);

    String getFirstAttribute(String name);

    Stream<String> getAttributeStream(String name);

    Map<String, List<String>> getAttributes();

    String getFirstName();

    void setFirstName(String firstName);

    String getLastName();

    void setLastName(String lastName);

    String getEmail();

    void setEmail(String email);

}
