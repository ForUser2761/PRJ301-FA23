/*				
 * Copyright (C) FPT University , Ltd. 2023	
 * 07/02/2023 FPT VinhPK2 DEBIT_BOOK_ITER1
 */
package dal;

import mapper.IGenericMapper;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.lang.reflect.InvocationTargetException;

public class DBContext_1<T> {

    protected Connection connection;
    protected PreparedStatement statement;
    protected ResultSet resultSet;
    // Các constant đại diện cho giá trị true và false trong việc sử dụng OR và AND
    public static final boolean CONDITION_OR = true;
    public static final boolean CONDITION_AND = false;

    /**
     * get an connection
     *
     * @return connection or null
     * @throws ClassNotFoundException
     */
    public Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_SU23";
            String user = "sa";
            String password = "12345678";
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        } catch (SQLException e) {
            System.out.println("Error " + e.getMessage() + "at DBContext");
            e.printStackTrace();
            return null;
        }
    }

    /**
     * get data from database
     *
     * @param entity : object represent table of data that we want to get
     * @param rowMapper : convert from ResultSet to List<T>
     * @param conditions : conditions for getting data
     * @return List
     */
    public List<T> query(T entity, IGenericMapper<T> rowMapper, Map<String, Object> conditions, boolean... condition) {
        boolean isConditionAnd = condition.length == 0 ? CONDITION_AND : condition[0];
        List<T> list = new ArrayList<>();
        ResultSet resultSet = null;

        try {
            // Lấy thông tin lớp của đối tượng thực thể
            Class<?> clazz = entity.getClass();
            Field[] fields = clazz.getDeclaredFields();

            // Xây dựng câu truy vấn SELECT * FROM <table_name>
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT * FROM ").append(clazz.getSimpleName());

            // Danh sách các giá trị tham số của câu truy vấn
            List<Object> parameters = new ArrayList<>();

            // Nếu có điều kiện, thêm phần WHERE vào câu truy vấn
            if (conditions != null && !conditions.isEmpty()) {
                sqlBuilder.append(" WHERE ");
                for (Map.Entry<String, Object> entry : conditions.entrySet()) {
                    String conditionField = entry.getKey();
                    Object conditionValue = entry.getValue();

                    sqlBuilder.append(conditionField).append(" = ? ");
                    if (isConditionAnd) {
                        sqlBuilder.append("AND ");
                    } else {
                        sqlBuilder.append("OR ");
                    }

                    parameters.add(conditionValue);
                }
                // Xóa phần AND hoặc OR cuối cùng khỏi câu truy vấn
                sqlBuilder.delete(sqlBuilder.length() - (isConditionAnd ? 4 : 3), sqlBuilder.length());
            }

            // In ra câu truy vấn (thường dùng cho mục đích debug)
            System.out.println(sqlBuilder.toString());

            // Kết nối đến cơ sở dữ liệu và chuẩn bị câu truy vấn
            connection = getConnection();
            statement = connection.prepareStatement(sqlBuilder.toString());

            // Gán giá trị cho các tham số của câu truy vấn
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }

            // Thực thi câu truy vấn
            resultSet = statement.executeQuery();

            // Duyệt qua kết quả và ánh xạ thành các đối tượng thực thể
            while (resultSet.next()) {
                list.add(rowMapper.mapRow(resultSet));
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("PHAM KHAC VINH: Loi o ham query");
            throw new RuntimeException(e);
        } finally {
            // Đảm bảo đóng tất cả kết nối và tài nguyên
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                System.out.println("PHAM KHAC VINH: Loi o ham query");
                throw new RuntimeException(e);
            }
        }
        // Trả về danh sách các đối tượng thực thể
        return list;
    }

    public <T> List<T> query(Class<T> clazz, Map<String, Object> conditions) {

        List<T> result = new ArrayList<>();
        try {
            // Lấy kết nối
            connection = getConnection();

            // Tạo câu lệnh SELECT
            String sql = "SELECT * FROM " + clazz.getSimpleName();

            // Thêm điều kiện WHERE nếu có
            if (conditions != null && !conditions.isEmpty()) {
                sql += " WHERE ";
                // code thêm điều kiện WHERE
            }

            // Chuẩn bị câu lệnh
            statement = connection.prepareStatement(sql);

            // Thực thi truy vấn
            resultSet = statement.executeQuery();

            // Khai báo danh sách kết quả
            // Duyệt result set   
            while (resultSet.next()) {
                // Gọi hàm mapRow để map đối tượng
                T obj = mapRow(resultSet, clazz);

                // Thêm vào danh sách kết quả
                result.add(obj);
            }

            return result;
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        } finally {
            try {
                // Đóng kết nối và các tài nguyên
                if (resultSet != null) {

                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                System.out.println("Exception: " + e.getMessage());
            }
        }
        return result;
    }

    // Hàm mapRow để map result set sang đối tượng
    public static <T> T mapRow(ResultSet rs, Class<T> clazz) throws
            SQLException,
            NoSuchMethodException,
            InstantiationException,
            IllegalArgumentException,
            IllegalAccessException,
            InvocationTargetException {

        // Khởi tạo đối tượng
        T obj = clazz.getDeclaredConstructor().newInstance();

        // Lấy danh sách các field của lớp
        Field[] fields = clazz.getDeclaredFields();

        // Duyệt qua từng field
        for (Field field : fields) {

            // Set giá trị cho field
            Object value = getFieldValue(rs, field);
            field.setAccessible(true);
            field.set(obj, value);
        }

        return obj;
    }

// Hàm lấy giá trị cho field từ result set
    private static Object getFieldValue(ResultSet rs, Field field) throws SQLException {

        Class<?> fieldType = field.getType();
        String fieldName = field.getName();

        // Kiểm tra kiểu dữ liệu và convert sang đúng kiểu
        if (fieldType == String.class) {
            return rs.getString(fieldName);
        } else if (fieldType == int.class || fieldType == Integer.class) {
            return rs.getInt(fieldName);
        } else if (fieldType == long.class || fieldType == Long.class) {
            return rs.getLong(fieldName);
        } else if (fieldType == double.class || fieldType == Double.class) {
            return rs.getDouble(fieldName);
        } else if (fieldType == boolean.class || fieldType == Boolean.class) {
            return rs.getBoolean(fieldName);
        } else if (fieldType == float.class || fieldType == Float.class) {
            return rs.getFloat(fieldName);
        } else {
            return rs.getObject(fieldName);
        }
    }

    /**
     *
     * @param object
     * @param conditions
     * @param useOr true: OR false: AND
     */
    public void update(T object, Map<String, Object> conditions, boolean... condition) {
        Class<?> clazz = object.getClass();
        Field[] fields = clazz.getDeclaredFields();
        boolean isConditionAnd = condition.length == 0 ? CONDITION_AND : condition[0];
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("UPDATE ").append(clazz.getSimpleName()).append(" SET ");

        List<Object> parameters = new ArrayList<>();

        for (Field field : fields) {
            field.setAccessible(true);
            String fieldName = field.getName();
            Object fieldValue;
            try {
                fieldValue = field.get(object);
            } catch (IllegalAccessException e) {
                fieldValue = null;
            }

            if (fieldValue != null && !fieldName.equalsIgnoreCase("id")) {
                sqlBuilder.append(fieldName).append(" = ?, ");
                parameters.add(fieldValue);
            }
        }

        if (sqlBuilder.charAt(sqlBuilder.length() - 2) == ',') {
            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length());
        }

        if (conditions != null && !conditions.isEmpty()) {
            sqlBuilder.append(" WHERE ");
            int index = 0;
            for (Map.Entry<String, Object> entry : conditions.entrySet()) {
                String conditionField = entry.getKey();
                Object conditionValue = entry.getValue();

                if (index > 0) {
                    // Dùng AND hoặc OR tùy thuộc vào giá trị của useOr
                    sqlBuilder.append(isConditionAnd ? " AND " : " OR ");
                }

                sqlBuilder.append(conditionField).append(" = ?");
                parameters.add(conditionValue);

                index++;
            }
        }

        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sqlBuilder.toString());

            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }

            statement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext_1.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public int insert(T object) {
        Class<?> clazz = object.getClass();
        Field[] fields = clazz.getDeclaredFields();

        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("INSERT INTO ").append(clazz.getSimpleName()).append(" (");

        List<Object> parameters = new ArrayList<>();

        // Xây dựng danh sách các trường và giá trị tham số của câu truy vấn
        for (Field field : fields) {
            field.setAccessible(true);
            String fieldName = field.getName();
            Object fieldValue;
            try {
                fieldValue = field.get(object);
            } catch (IllegalAccessException e) {
                fieldValue = null;
            }

            if (fieldValue != null && !fieldName.equalsIgnoreCase("id")) {
                sqlBuilder.append(fieldName).append(", ");
                parameters.add(fieldValue);
            }
        }

        // Xóa dấu phẩy cuối cùng
        if (sqlBuilder.charAt(sqlBuilder.length() - 2) == ',') {
            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length());
        }

        sqlBuilder.append(") VALUES (");
        for (int i = 0; i < parameters.size(); i++) {
            sqlBuilder.append("?, ");
        }

        // Xóa dấu phẩy cuối cùng
        if (sqlBuilder.charAt(sqlBuilder.length() - 2) == ',') {
            sqlBuilder.delete(sqlBuilder.length() - 2, sqlBuilder.length());
        }

        sqlBuilder.append(")");
        ResultSet resultSet = null;
        try {
            connection = getConnection();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext_1.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        int id = 0;
        try {
            // Bắt đầu giao dịch và chuẩn bị câu truy vấn
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(sqlBuilder.toString(), Statement.RETURN_GENERATED_KEYS);

            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }

            // Thực thi câu truy vấn
            statement.executeUpdate();

            // Lấy khóa chính (ID) được tạo tự động
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }

            // Xác nhận giao dịch thành công
            connection.commit();
        } catch (SQLException e) {
            try {
                System.out.println("PHAM KHAC VINH (LOI INSERT): " + e.getMessage());
                e.printStackTrace();
                // Hoàn tác giao dịch nếu xảy ra lỗi
                connection.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        } finally {
            // Đảm bảo đóng kết nối và tài nguyên
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        // Trả về ID được tạo tự động (nếu có)
        return id;
    }

    /**
     * find total record of a table
     *
     * @param sql
     * @param parameters
     * @return total record or 0
     */
    public int findTotalRecord(String sql, Parameter... parameters) {
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            setParameter(parameters);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int total = resultSet.getInt(1);
                return total;
            }

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();

        } catch (SQLException ex) {
            Logger.getLogger(DBContext_1.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                System.out.println("PHAM KHAC VINH: Loi o ham query");
                throw new RuntimeException(e);
            }
        }
        return 0;

    }

    private int getSqlType(Class<?> clazz) {
        if (clazz.equals(Integer.class
        ) || clazz.equals(
                int.class
        )) {
            return Types.INTEGER;
        } else if (clazz.equals(String.class
        )) {
            return Types.NVARCHAR;
        } else if (clazz.equals(Date.class
        )) {
            return Types.TIMESTAMP;
        } else if (clazz.equals(Boolean.class
        ) || clazz.equals(
                boolean.class
        )) {
            return Types.BOOLEAN;
        } else if (clazz.equals(BigDecimal.class
        )) {
            return Types.NUMERIC;
        } else if (clazz.equals(Float.class
        ) || clazz.equals(
                float.class
        )) {
            return Types.FLOAT;
        } else {
            // Thêm kiểu dữ liệu khác nếu cần thiết
            return Types.OTHER;
        }
    }

    /**
     * mapping parameter to their types
     *
     * @param parameter : parameter we want to pass to the SQL query
     */
    private void setParameter(Parameter... parameter) {
        try {
            for (int i = 0; i < parameter.length; i++) {
                Parameter object = parameter[i];
                int index = i + 1;
                if (object.getValue() instanceof Integer) {
                    statement.setInt(index, (int) object.getValue());
                } else if (object.getValue() instanceof String) {
                    statement.setString(index, (String) object.getValue());
                } else if (object.getValue() instanceof Date) {
                    statement.setDate(index, (Date) object.getValue());
                } else if (object.getValue() == null) {
                    statement.setNull(index, object.getType());
                } else if (object.getValue() instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) object.getValue());
                } else if (object.getValue() instanceof Boolean) {
                    statement.setBoolean(index, (Boolean) object.getValue());
                } else if (object.getValue() instanceof BigDecimal) {
                    statement.setBigDecimal(index, (BigDecimal) object.getValue());
                } else if (object.getValue() instanceof Float) {
                    statement.setFloat(index, (float) object.getValue());
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
