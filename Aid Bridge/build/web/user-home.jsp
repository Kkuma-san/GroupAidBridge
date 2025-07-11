<%@ page import="java.util.*, model.Product, model.ProductDAO" %>
<%@ page session="true" %>
<%
    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts(null, null); // No search, no sort

    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
    <link rel="stylesheet" href="css/user-home.css">
</head>
<body>

<div id="mySidebar" class="sidebar">
    <div class="sidebar-header">
        <div class="user-profile">
            <div class="user-picture" id="userProfilePic" style="background-image: url('images/user.png');"></div>
            <span class="username"><%= username %></span>
        </div>
        <button class="closebtn" onclick="closeNav()">&times;</button>
    </div>
    <nav class="sidebar-nav">
        <a href="booking-history">Purchase History</a>
    </nav>
    <a href="logout.jsp" class="logout-button">Logout</a>
</div>

<div id="main" class="main-content">
    <div class="top-navigation">
        <div class="menu-logo-group">
            <button class="openbtn" onclick="openNav()">&#9776;</button>
            <div class="logo-container">
                <img src="images/logo.png" alt="My Logo" id="page-logo">
            </div>
        </div>

        <div class="cart-icon">
            <a href="cart.jsp">
                <img src="https://img.icons8.com/ios-glyphs/30/007bff/shopping-cart--v1.png" alt="Cart"/>
            </a>
        </div>
    </div>

    <div class="content-area">
        <div class="items-grid">
            <div class="item-card">
                <div class="item-picture">
                    <img src="images/item 1.png" alt="6 x MRE packages">
                </div>
                <div class="item-name">6 x MRE packages</div>
                <form method="post" action="AddToCartServlet">
                    <input type="hidden" name="productId" value="1"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <div class="item-price">RM 19.99</div>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <div class="item-card">
                <div class="item-picture">
                    <img src="images/item 2.png" alt="Multi Purpose Bag">
                </div>
                <div class="item-name">Multi Purpose Bag</div>
                <form method="post" action="AddToCartServlet">
                    <input type="hidden" name="productId" value="2"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <div class="item-price">RM 25.50</div>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <div class="item-card">
                <div class="item-picture">
                    <img src="images/item 3.png" alt="6 x Water Bottles">
                </div>
                <div class="item-name">6 x Water Bottles</div>
                <form method="post" action="AddToCartServlet">
                    <input type="hidden" name="productId" value="3"/>
                    <input type="hidden" name="quantity" value="1"/>
                     <div class="item-price">RM 9.75</div>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <div class="item-card">
                <div class="item-picture">
                    <img src="images/item 4.png" alt="6 x First Aid Kits">
                </div>
                <div class="item-name">6 x First Aid Kits</div>
                <form method="post" action="AddToCartServlet">
                    <input type="hidden" name="productId" value="4"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <div class="item-price">RM 49.00</div>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <div class="item-card">
                <div class="item-picture">
                    <img src="images/item 5.png" alt="DIY Shelter">
                </div>
                <div class="item-name">DIY Shelter</div>
                <form method="post" action="AddToCartServlet">
                    <input type="hidden" name="productId" value="5"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <div class="item-price">RM 70.00</div>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>

            <div class="item-card">
                <div class="item-picture">
                    <img src="images/item 6.png" alt="6 x Hygiene Kits">
                </div>
                <div class="item-name">6 x Hygiene Kits</div>
                <form method="post" action="AddToCartServlet">
                    <input type="hidden" name="productId" value="6"/>
                    <input type="hidden" name="quantity" value="1"/>
                    <div class="item-price">RM 50.00</div>
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function openNav() {
        document.getElementById("mySidebar").style.width = "280px";
    }

    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
    }

    document.addEventListener("DOMContentLoaded", function () {
        fetch('products')
            .then(response => response.json())
            .then(data => {
                const itemsGrid = document.querySelector(".items-grid");
                itemsGrid.innerHTML = "";

                data.forEach(product => {
                    const itemCard = document.createElement("div");
                    itemCard.className = "item-card";
                    itemCard.onclick = () => location.href = `product-details.html?id=${product.id}`;

                    itemCard.innerHTML = `
                        <div class="item-picture">
                            <img src="${product.image}" alt="${product.name}">
                        </div>
                        <div class="item-name">${product.name}</div>
                    `;

                    itemsGrid.appendChild(itemCard);
                });
            })
            .catch(err => console.error("Error loading products:", err));
    });
</script>

</body>
</html>



