<html>
    <head>
        <title>Billing Page</title>
    </head>
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

    </body>
</html>