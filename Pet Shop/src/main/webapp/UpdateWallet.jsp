<%@page import="com.petshop.exception.InvalidWalletAmount"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.model.*"%>
<%@page import="com.petshop.daoimpl.*"%>

	<%
	double wallet = Integer.parseInt(request.getParameter("wallet"));
	boolean message = true;
	PrintWriter write = response.getWriter();
	if (wallet <= 0) {
		try {
			throw new InvalidWalletAmount();
		} catch (InvalidWalletAmount e) {
			write.print(e);
		}
		message = false;
	}
	if (message) {
		Customers customer = (Customers) session.getAttribute("customer");
		customer.setWallet(customer.getWallet() + wallet);
		CustomerDAO customerDao = new CustomerDAO();
		customerDao.updateWallet(customer);
		write.print("Amount Added");
	}
	%>
