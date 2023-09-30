/*				
 * Copyright (C) FPT University , Ltd. 2023	
 * 30/09/2023 FPT 4USER
 */
package dal;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.sql.Types;

public class Parameter {

    private Object value;
    private int type;

    public Parameter() {
    }

    public Parameter(Object value) {
        this.value = value;
//        this.type = type;
    }

    public Parameter(Object value, int type) {
        this.value = value;
        this.type = type;
    }

    public Object getValue() {
        return value;
    }

    public int getType() {
        if (value instanceof Integer) {
            return Types.INTEGER;
        } else if (value instanceof String) {
            return Types.NVARCHAR;
        } else if (value instanceof Date) {
            return Types.DATE;
        } else if (value == null) {
            return Types.NULL;
        } else if (value instanceof Timestamp) {
            return Types.TIMESTAMP;
        } else if (value instanceof Boolean) {
            return Types.BIT;
        } else if (value instanceof BigDecimal) {
            return Types.DECIMAL;
        } else if (value instanceof Float) {
            return Types.FLOAT;
        }
        return 0;
    }

    public void setValue(Object value) {
        this.value = value;
    }

//    public void setTypes(int type) {
//        this.type = type;
//    }
}
