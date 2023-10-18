<%-- 
    Document   : MyExam
    Created on : Jul 16, 2023, 2:59:14 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="execute" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Enter an integer n:</td>
                        <td>
                            <input type="text" name="number" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Result: 
                        </td>
                        <td>
                            <input type="text" name="result" value="${result}" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit">Execute</button>
                        </td>
                        <td>
                            ${error}
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>

    </body>
</html>
