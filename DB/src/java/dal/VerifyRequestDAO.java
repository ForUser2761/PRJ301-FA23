/*				
 * Copyright (C) FPT University , Ltd. 2023	
 * 30/09/2023 FPT 4USER
 */
package dal;

import java.util.List;
import model.VerifyRequest;

/**
 *
 * @author ADMIN
 */
public class VerifyRequestDAO extends GenericDAO<VerifyRequest>{
    
    public List<VerifyRequest> findAll() {
        List<VerifyRequest> list = query(VerifyRequest.class, null);
        return list;
    }
    
    public static void main(String[] args) {
        for (VerifyRequest verifyRequest : new VerifyRequestDAO().findAll()) {
            System.out.println(verifyRequest);
        }
    }
}
