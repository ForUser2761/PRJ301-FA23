/*				
 * Copyright (C) FPT University , Ltd. 2023	
 * 30/09/2023 FPT 4USER
 */
package dal;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author 4USER
 * @param <T>
 */
public abstract class GenericDAO<T> extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;
    protected HashMap<String, Object> conditions;
    // Các constant đại diện cho giá trị true và false trong việc sử dụng OR và AND
    public static final boolean CONDITION_OR = true;
    public static final boolean CONDITION_AND = false;

    public List<T> query(Class<T> clazz, boolean... condition) {

        boolean isConditionAnd = condition.length == 0 ? CONDITION_AND : condition[0];
        List<T> result = new ArrayList<>();
        try {
            // Lấy kết nối
            connection = getConnection();

            // Tạo câu lệnh SELECT
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT * FROM ").append(clazz.getSimpleName());
            //List parameter
            List<Object> parameters = new ArrayList<>();

            // Thêm điều kiện WHERE nếu có
            if (conditions != null && !conditions.isEmpty()) {
                sqlBuilder.append(" WHERE ");
                // code thêm điều kiện WHERE
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

            System.out.println(sqlBuilder.toString());

            // Chuẩn bị câu lệnh
            statement = connection.prepareStatement(sqlBuilder.toString());

            // Gán giá trị cho các tham số của câu truy vấn
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }

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
        } catch (IllegalAccessException
                | IllegalArgumentException
                | InstantiationException
                | NoSuchMethodException
                | InvocationTargetException
                | SQLException e) {
            System.err.println("4USER: Bắn Exception ở hàm query: " + e.getMessage());
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
                System.err.println("4USER: Bắn Exception ở hàm query: " + e.getMessage());
            }
        }
        return result;
    }

    /**
     * Hàm mapRow để map result set sang đối tượng
     *
     * @param <T>
     * @param rs
     * @param clazz
     * @return
     * @throws SQLException
     * @throws NoSuchMethodException
     * @throws InstantiationException
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     * @throws InvocationTargetException
     */
    private static <T> T mapRow(ResultSet rs, Class<T> clazz) throws
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

    /**
     * Hàm lấy giá trị cho field từ result set
     *
     * @param rs
     * @param field
     * @return
     * @throws SQLException
     */
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
     * @param condition
     */
    public void update(T object, boolean... condition) {
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
                System.err.println("4USER: Bắn Exception ở hàm update: " + ex.getMessage());
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                System.err.println("4USER: Bắn Exception ở hàm update: " + e.getMessage());
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
        connection = getConnection();
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
                System.err.println("4USER: Bắn Exception ở hàm insert: " + e.getMessage());
                // Hoàn tác giao dịch nếu xảy ra lỗi
                connection.rollback();
            } catch (SQLException ex) {
                System.err.println("4USER: Bắn Exception ở hàm insert: " + ex.getMessage());
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
                System.err.println("4USER: Bắn Exception ở hàm insert: " + e.getMessage());
            }
        }
        // Trả về ID được tạo tự động (nếu có)
        return id;
    }

    public int findTotalRecord(Class<T> clazz, boolean... condition) {
        boolean isConditionAnd = condition.length == 0 ? CONDITION_AND : condition[0];
        int total = 0;
        try {
            // Lấy kết nối
            connection = getConnection();

            // Tạo câu lệnh SELECT
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT COUNT(*) FROM ").append(clazz.getSimpleName());
            //List parameter
            List<Object> parameters = new ArrayList<>();

            // Thêm điều kiện WHERE nếu có
            if (conditions != null && !conditions.isEmpty()) {
                sqlBuilder.append(" WHERE ");
                // code thêm điều kiện WHERE
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

            System.out.println(sqlBuilder.toString());

            // Chuẩn bị câu lệnh
            statement = connection.prepareStatement(sqlBuilder.toString());

            // Gán giá trị cho các tham số của câu truy vấn
            int index = 1;
            for (Object value : parameters) {
                statement.setObject(index, value);
                index++;
            }

            // Thực thi truy vấn
            resultSet = statement.executeQuery();

            // Khai báo danh sách kết quả
            // Duyệt result set   
            if (resultSet.next()) {
                total = resultSet.getInt(1);
            }

        } catch (IllegalArgumentException | SQLException e) {
            System.err.println("4USER: Bắn Exception ở hàm findTotalRecord: " + e.getMessage());
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
                System.err.println("4USER: Bắn Exception ở hàm findTotalRecord: " + e.getMessage());
            }
        }
        return total;
    }

}