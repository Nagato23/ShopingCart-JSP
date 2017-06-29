<%@include file="HeaderLibrary.jsp" %>


<%
  String email = request.getParameter("email");
  String password = request.getParameter("password");

  query = String.format("SELECT * FROM user WHERE email='%s' AND password='%s' LIMIT 1", email, password);

  ResultSet set = st.executeQuery(query);


  while (set.next()) {

    if (set.getString("email").equals(email) && 
        set.getString("password").equals(password)) {
      session = request.getSession(false);

      session.setAttribute("user_id", set.getString("id"));
      
      out.print( set.getString("id"));
    }
  }
%>