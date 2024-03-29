// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.one.note.noted.domain.UserAccount;

privileged aspect UserAccount_Roo_Json {
    
    public String UserAccount.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static UserAccount UserAccount.fromJsonToUserAccount(String json) {
        return new JSONDeserializer<UserAccount>().use(null, UserAccount.class).deserialize(json);
    }
    
    public static String UserAccount.toJsonArray(Collection<UserAccount> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<UserAccount> UserAccount.fromJsonArrayToUserAccounts(String json) {
        return new JSONDeserializer<List<UserAccount>>().use(null, ArrayList.class).use("values", UserAccount.class).deserialize(json);
    }
    
}
