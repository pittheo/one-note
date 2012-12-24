// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.one.note.noted.web;

import java.lang.Boolean;
import java.lang.Long;
import java.lang.String;
import java.util.List;

import org.one.note.noted.domain.UserAccount;
import org.one.note.noted.domain.beans.AutocompleteVO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect UserAccountController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.showJson(@PathVariable("id") Long id) {
        UserAccount useraccount = UserAccount.findUserAccount(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        if (useraccount == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(useraccount.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(UserAccount.toJsonArray(UserAccount.findAllUserAccounts()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> UserAccountController.createFromJson(@RequestBody String json) {
        UserAccount.fromJsonToUserAccount(json).persist();
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> UserAccountController.createFromJsonArray(@RequestBody String json) {
        for (UserAccount userAccount: UserAccount.fromJsonArrayToUserAccounts(json)) {
            userAccount.persist();
        }
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> UserAccountController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        if (UserAccount.fromJsonToUserAccount(json).merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> UserAccountController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        for (UserAccount userAccount: UserAccount.fromJsonArrayToUserAccounts(json)) {
            if (userAccount.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> UserAccountController.deleteFromJson(@PathVariable("id") Long id) {
        UserAccount useraccount = UserAccount.findUserAccount(id);
        HttpHeaders headers= new HttpHeaders();
        headers.add("Content-Type", "application/text");
        if (useraccount == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        useraccount.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByEmailEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.jsonFindUserAccountsByEmailEquals(@RequestParam("email") String email) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(UserAccount.toJsonArray(UserAccount.findUserAccountsByEmailEquals(email).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByEmailEqualsAndPasswordEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.jsonFindUserAccountsByEmailEqualsAndPasswordEquals(@RequestParam("email") String email, @RequestParam("password") String password) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(UserAccount.toJsonArray(UserAccount.findUserAccountsByEmailEqualsAndPasswordEquals(email, password).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByUsernameEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.jsonFindUserAccountsByUsernameEquals(@RequestParam("username") String username) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(UserAccount.toJsonArray(UserAccount.findUserAccountsByUsernameEquals(username).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByUsernameEqualsAndPasswordEquals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.jsonFindUserAccountsByUsernameEqualsAndPasswordEquals(@RequestParam("username") String username, @RequestParam("password") String password) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(UserAccount.toJsonArray(UserAccount.findUserAccountsByUsernameEqualsAndPasswordEquals(username, password).getResultList()), headers, HttpStatus.OK);
    }
    
	@RequestMapping(value = "/find.json", params = "find=ByUsernameLike", method = RequestMethod.GET)
    public @ResponseBody List<UserAccount> jsonFindUserAccountsByUsernameLike(@RequestParam("username") String username, Model model) {
		return UserAccount.findUserAccountsByUsernameLike(username).getResultList();
    }
    
    @RequestMapping(params = "find=ByVerifiedNot", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> UserAccountController.jsonFindUserAccountsByVerifiedNot(@RequestParam(value = "verified", required = false) Boolean verified) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/text; charset=utf-8");
        return new ResponseEntity<String>(UserAccount.toJsonArray(UserAccount.findUserAccountsByVerifiedNot(verified == null ? new Boolean(false) : verified).getResultList()), headers, HttpStatus.OK);
    }
    
	@RequestMapping(value = "/autocomplete", params = "find=ByUsernameLike", method=RequestMethod.GET)
	public @ResponseBody AutocompleteVO[] getUsersByUsernameLikeInJsonList(@RequestParam String tag, Model model) {
		List<UserAccount> users = jsonFindUserAccountsByUsernameLike(tag, model);
		
		AutocompleteVO[] usersArray = new AutocompleteVO[users.size()];
		for (int i = 0; i < users.size(); i++) {
			usersArray[i] = new AutocompleteVO(String.valueOf(users.get(i).getId()), users.get(i).getUsername());
		}
		
		return usersArray;	
	}
    
}