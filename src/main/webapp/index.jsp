<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">
.back-img{
background:url("img/b.jpg");
height:50vh;
width:100%;
backgroun-repeat:no-repeat;
background-size:cover;
}
.crd-ho:hover{
background-color:#fcf7f7;
}
</style>
</head>
<body style="background-color:#f7f7f7;">
	<%
	User u=(User)session.getAttribute("userobj");
	%>
    <%@include file="all_component/navbar.jsp" %>
    <div class="container-fuild back-img">
         
    </div>
<!-- Start Recent Book -->
	<div class="container-fluid">
		<h3 class="text-center mt-2">Recent Book</h3>
	<div class="row p-5">
        <% 
        BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list2 = dao2.getRecentBooks();
        for (BookDtls b : list2) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumbnail">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>
                    	<%
                    	if(b.getBookCategory().equals("Old")){
                    	%>
                    	Categories:<%=b.getBookCategory()%></p> 
                    <div class="row">
                       <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa fa-inr" aria-hidden="true"></i></a>
                    </div>
                    <%
                    } else {
                    %>
                     Categories:<%=b.getBookCategory()%></p>
                    <div class="row">
                    <% if(u==null)
                    {%>
                    <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                    <%
                    } else {
                    %>
                    <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                    <% 
                    }
                    
                    %> 
                        <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa fa-inr" aria-hidden="true"></i></a>
                    </div>
                    <% 
                    }
                    %>
                   
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
    <div class="text-center mt-1">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
    </div>
</div>
<!-- End Recent Book -->
<hr>

<!-- Start New Book -->
	<div class="container-fluid">
    <h3 class="text-center">New Book</h3>
    <div class="row p-5">
        <% 
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list = dao.getNewBook();
        for (BookDtls b : list) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumbnail">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Categories:<%=b.getBookCategory()%></p>
                    <div class="row ">
                    
                    <% if(u==null)
                    {%>
                    <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                    <%
                    } else {
                    %>
                    <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
                    <% 
                    }
                    
                    %>
                    
                        <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa fa-inr" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <div class="text-center ">
        <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
    </div>
</div>
	
		<!-- End New Book -->
<hr>
<!-- Start Old Book -->
	<div class="container-fluid">
		<h3 class="text-center">Old Book</h3>
		<div class="row p-5">
		<% 
        BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list3 = dao3.getOldBooks();
        for (BookDtls b : list3) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>" style="width: 150px; height: 200px" class="img-thumbnail">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%></p>
                     <p>Categories:<%=b.getBookCategory()%></p>
                    <div class="row">
                        <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
                        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa fa-inr" aria-hidden="true"></i></a>
                    </div>
                   
                </div>
            </div>
        </div>
        <%
        }
        %>
				</div>
			</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
		</div>
<!-- End Old Book -->
 <hr style="border-top: 5px solid orange;">
<%@include file="all_component/footer.jsp" %>
 
</body>
</html>