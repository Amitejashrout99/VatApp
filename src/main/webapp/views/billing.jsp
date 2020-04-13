<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Billing Page</title>
    </head>
    <style>
        td, th {
            border: 1px solid black;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: black;
            color: white;
        }
    </style>
    <body>
        <h2 style="text-align: center">Your Billing Page</h2>
        <h1 style="text-align: center">Search for your product either by:</h1>
        <div style="display: flex;align-content: center;justify-content: center;text-align: center">
            <form action="getProductByCode" method="get">
                Enter your Product Code
                <br>
                <input type="number" name="product_code"/>
                <input type="submit" value="Search">
            </form>
            <form action="getProductByName" method="get">
                Enter your Product Name
                <br>
                <input type="text" name="product_name"/>
                <input type="submit" value="Search">
            </form>
        </div>
        <hr>
        ${result}
        <table style="width: 100%;
                     display: flex;
                     justify-content: center;
                     align-content: center;
                     text-align: center;
                     font-family: 'Times New Roman';">
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>GST applied</th>
                <th>Quantity of Product needed</th>
            </tr>
            <c:forEach items="${result}" var="item">
                <tr>
                    <td><c:out value="${item.product_code}" /></td>
                    <td><c:out value="${item.product_name}" /></td>
                    <td><c:out value="${item.product_price}" /></td>
                    <td><c:out value="${item.product_gst}" /></td>
                    <td><input type="number" id="entry+${item.product_code}" onkeyup="checkMethod(${item.product_price},${item.product_code})"
                    onchange="changeMethod()"></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2">Total</td>
                <td id="getTotal"></td>
                <td id="getVat"></td>
                <td id="grandTotal"></td>
            </tr>
        </table>
    </body>
    <script>
        var total_price=0;
        var vat=0;
        var grand_total=0;
        function checkMethod(product_price,product_code)
        {
            var quant=0;
            quant= document.getElementById("entry"+"+"+product_code).value;
            var value= quant*product_price;
            total_price+=value;
            vat=((18*total_price)/100).toFixed(2);

            grand_total=total_price+parseInt(vat);

            document.getElementById("getTotal").innerHTML="Total Price is"+total_price;
            document.getElementById("getVat").innerHTML="Vat is"+vat;
            document.getElementById("grandTotal").innerHTML="Grand Total is"+grand_total;
        }

        function changeMethod()
        {
            alert("changed");
        }



    </script>
</html>